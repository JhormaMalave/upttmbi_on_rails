class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|
      t.belongs_to :id_type, null: false, foreign_key: true
      t.string :id_number
      t.string :name
      t.string :surname
      t.date :birth_date
      t.text :obsevation
      t.date :hire_date
      t.date :ordinary_date
      t.boolean :status

      t.timestamps
    end
  end
end
