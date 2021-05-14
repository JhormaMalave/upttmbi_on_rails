class CreateTeacherDegrees < ActiveRecord::Migration[6.1]
  def change
    create_table :teacher_degrees do |t|
      t.string :name
      t.integer :degree_type
      t.boolean :status
      t.belongs_to :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
