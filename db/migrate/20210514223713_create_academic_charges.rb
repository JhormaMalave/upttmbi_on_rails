class CreateAcademicCharges < ActiveRecord::Migration[6.1]
  def change
    create_table :academic_charges do |t|
      t.belongs_to :teacher_career, null: false, foreign_key: true
      t.belongs_to :section, null: false, foreign_key: true
      t.belongs_to :subject, null: false, foreign_key: true
      t.text :observation

      t.timestamps
    end
  end
end
