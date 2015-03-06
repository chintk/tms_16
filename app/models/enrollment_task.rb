class EnrollmentTask < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  belongs_to :subject
  belongs_to :course

  after_update :insert_activity

  private
  def insert_activity
    if status
      @activity = user.activities.build acti: 2, course: course, subject: subject, task: task
      @activity.save
    end
  end
end