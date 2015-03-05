class Subject < ActiveRecord::Base
  has_many :user, through: :enrollment_subjects
  has_many :enrollment_subjects, dependent: :destroy
  has_many :enrollment_tasks, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :tasks, dependent: :destroy
  
  accepts_nested_attributes_for :tasks, allow_destroy: true  
  accepts_nested_attributes_for :enrollment_tasks

  validates :name,  presence: true, length: {maximum: 50}
  validates :description,  presence: true

  def status(user, course)
    self.enrollment_subjects.find_by(user_id: user.id, course_id: course.id).status
  end
end