class EnrollmentSubject < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject
  belongs_to :user

  after_update :insert_activity

  private
  def insert_activity
    if status
      @activity = user.activities.build acti: 2, course: course, subject: subject
      @activity.save
    end
  end
end