class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :type
      t.references :user, index: true
      t.references :course, index: true
      t.references :subject, index: true
      t.references :task, index: true

      t.timestamps null: false
    end
    add_foreign_key :activities, :users
    add_foreign_key :activities, :courses
    add_foreign_key :activities, :subjects
    add_foreign_key :activities, :tasks
  end
end