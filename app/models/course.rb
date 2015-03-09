class Course < ActiveRecord::Base
  has_many :enrollments, autosave: true, :dependent => :destroy
  has_many :users, autosave: true, through: :enrollments
  has_many :enrollment_subjects, autosave: true, :dependent => :destroy
  has_many :enrollment_tasks, autosave: true, :dependent => :destroy
  has_many :course_subjects, autosave: true, :dependent => :destroy
  has_many :subjects, autosave: true, through: :course_subjects
  has_many :activities, autosave: true, :dependent => :destroy

  validates :name,  presence: true, length: {maximum: 50}
  validates :description,  presence: true

  after_save :start_subject_and_add_enrollment_subjects
  after_save :finish_subjects

  private
  def start_subject_and_add_enrollment_subjects
    if self.begin && self.end.nil?
      rebuild_enrollment_subjects
      rebuild_enrollment_tasks
      insert_activity
      start_subject
    end
  end

  def rebuild_enrollment_subjects
    self.users.normal.each do |user|
      user.subjects << self.subjects      
      user.enrollment_subjects.each do |es| 
        if es.course_id.nil?
          es.update_attributes course: self
        end
      end
      user.save
    end
  end

  def rebuild_enrollment_tasks
    self.subjects.each do |subject|
      self.users.normal.each do |u| 
        u.tasks << subject.tasks
        u.save
      end
    end
    self.users.normal.each do |user|
      user.enrollment_tasks.each do |et| 
        if et.course_id.nil?
          et.update_attributes course: self, subject: et.task.subject
        end
      end
    end
  end

  def start_subject
    self.course_subjects.each{|cs| cs.update_attributes begin: self.begin}
  end

  def finish_subjects
    self.course_subjects.each{|cs| cs.update_attributes end: self.end} if self.end
  end

  def insert_activity
    self.users.normal.each do |user|
      @activity = self.activities.build acti: 1, user: user
      @activity.save  
    end
  end
end