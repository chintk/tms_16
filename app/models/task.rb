class Task < ActiveRecord::Base
  has_many :enrollment_tasks, :dependent => :destroy
  has_many :users, through: :enrollment_tasks
  has_many :activities, :dependent => :destroy

  belongs_to :subject
end