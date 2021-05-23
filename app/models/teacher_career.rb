class TeacherCareer < ApplicationRecord
  belongs_to :teacher
  belongs_to :career
  has_many :academic_charges
  has_many :subjects, through: :academic_charges

  validates :teacher, uniqueness: { scope: :career }
  validates :status, inclusion: {in: [true, false]}
end
