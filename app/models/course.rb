class Course < ActiveRecord::Base
  has_many :enrollments, :dependent => :destroy
  has_many :enrollment_subjects, :dependent => :destroy
  has_many :enrollment_tasks, :dependent => :destroy
  has_many :course_subjects, :dependent => :destroy
  has_many :activities, :dependent => :destroy
end