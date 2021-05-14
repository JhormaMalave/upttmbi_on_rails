class TeacherDegree < ApplicationRecord
  belongs_to :teacher

  enum degree_type: ['Pre-Grado', 'Post-Grado', 'Curso']
  validates :status, inclusion: {in: [true, false]}
end
