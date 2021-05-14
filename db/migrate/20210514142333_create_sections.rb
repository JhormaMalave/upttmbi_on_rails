class CreateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :sections do |t|
      t.string :name
      t.integer :trimester
      t.integer :shift
      t.belongs_to :course, null: false, foreign_key: true
      t.belongs_to :period, null: false, foreign_key: true
      t.belongs_to :career, null: false, foreign_key: true

      t.timestamps
    end
  end
end
