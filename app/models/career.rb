class Career < ApplicationRecord
  has_many :subjects
  has_many :sections
  has_many :teacher_careers

  validates :name, presence: true, uniqueness: true
end
