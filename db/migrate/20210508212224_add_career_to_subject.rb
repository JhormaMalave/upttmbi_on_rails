class AddCareerToSubject < ActiveRecord::Migration[6.1]
  def change
    add_reference :subjects, :career, null: false, foreign_key: true
  end
end
