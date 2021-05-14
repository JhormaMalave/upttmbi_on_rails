class Teacher < ApplicationRecord
  has_many :teacher_careers
  belongs_to :id_type

  validates :id_number, presence: true, uniqueness: { scope: :id_type_id }
  validates :id_type, presence: true
  validates :name, presence: true
  validates :surname, presence: true
  validates :birth_date, inclusion: { in: (Date.new(1900,1,1)..Date.today-10.year) } unless :birth_date
  validates :status, inclusion: {in: [true, false]}
end
