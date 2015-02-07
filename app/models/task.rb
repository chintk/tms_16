class Task < ActiveRecord::Base
  has_many :enrollment_tasks
  has_many :activities

  belongs_to :subject
end