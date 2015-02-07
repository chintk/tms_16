class Activity < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject
  belongs_to :task
  belongs_to :user
end