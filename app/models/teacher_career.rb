class TeacherCareer < ApplicationRecord
  belongs_to :teacher
  belongs_to :career

  validates :teacher, uniqueness: { scope: :career }
  validates :status, inclusion: {in: [true, false]}
end
