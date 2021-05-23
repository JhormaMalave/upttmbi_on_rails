class AcademicCharge < ApplicationRecord
  belongs_to :teacher_career
  belongs_to :section
  belongs_to :subject
end
