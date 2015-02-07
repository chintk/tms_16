class CreateEnrollmentTasks < ActiveRecord::Migration
  def change
    create_table :enrollment_tasks do |t|
      t.date :begin
      t.date :end
      t.references :user, index: true
      t.references :course, index: true
      t.references :subject, index: true
      t.references :task, index: true

      t.timestamps null: false
    end
    add_foreign_key :enrollment_tasks, :users
    add_foreign_key :enrollment_tasks, :courses
    add_foreign_key :enrollment_tasks, :subjects
    add_foreign_key :enrollment_tasks, :tasks
  end
end