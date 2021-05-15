class AcademicCharge < ApplicationRecord
  belongs_to :teacher
  belongs_to :section
  belongs_to :subject
end
