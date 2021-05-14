class CreateTeacherCareers < ActiveRecord::Migration[6.1]
  def change
    create_table :teacher_careers do |t|
      t.belongs_to :teacher, null: false, foreign_key: true
      t.belongs_to :career, null: false, foreign_key: true
      t.text :observation
      t.boolean :status

      t.timestamps
    end
  end
end
