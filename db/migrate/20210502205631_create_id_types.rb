class CreateIdTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :id_types do |t|
      t.integer :name

      t.timestamps
    end
    add_index :id_types, :name, unique: true
  end
end
