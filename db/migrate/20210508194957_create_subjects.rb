class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :name, null: false
      t.integer :curricular_units
      t.integer :duration
      t.integer :subject_type
      t.boolean :status, null: false
      t.belongs_to :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
