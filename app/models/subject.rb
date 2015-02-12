class Subject < ActiveRecord::Base
  has_many :users, through: :enrollment_subjects
  has_many :enrollment_subjects, :dependent => :destroy
  has_many :enrollment_tasks, :dependent => :destroy
  has_many :course_subjects, :dependent => :destroy
  has_many :activities
  has_many :tasks, :dependent => :destroy 
  accepts_nested_attributes_for :tasks, :allow_destroy => true
end