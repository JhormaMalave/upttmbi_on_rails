class Subject < ApplicationRecord
  belongs_to :career
  belongs_to :course

  enum subject_type: ['Taller', 'Curso']
  enum duration: ['Trimestral', 'Semestral', 'Anual']
  validates :name, presence: true, uniqueness: { scope: :course }
  validates :curricular_units, presence: true, inclusion: { in: (1..9) }
  validates :subject_type, presence: true
  validates :duration, presence: true
  validates :status, inclusion: {in: [true, false]}

  def self.search(paramns = {})
    subjects = Subject.all
    subjects = subjects.where('lower(name) LIKE ?', "%#{paramns[:name].downcase}%") if paramns[:name].present?
    subjects = subjects.where(status: paramns[:status]) if paramns[:status].present?
    subjects = subjects.where(curricular_units: paramns[:curricular_units]) if paramns[:curricular_units].present?
    subjects = subjects.where(subject_type: paramns[:subject_type]) if paramns[:subject_type].present?


    subjects = subjects.where(course_id: paramns[:course_id]) if paramns[:course_id].present?
    subjects
  end
end
