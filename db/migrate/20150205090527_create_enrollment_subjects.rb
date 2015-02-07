class CreateEnrollmentSubjects < ActiveRecord::Migration
  def change
    create_table :enrollment_subjects do |t|
      t.references :user, index: true
      t.references :course, index: true
      t.references :subject, index: true

      t.timestamps null: false
    end
    add_foreign_key :enrollment_subjects, :users
    add_foreign_key :enrollment_subjects, :courses
    add_foreign_key :enrollment_subjects, :subjects
  end
end