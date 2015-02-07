class EnrollmentSubject < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject
  belongs_to :user
end