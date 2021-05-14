class Career < ApplicationRecord
  has_many :subjects
  has_many :sections

  validates :name, presence: true, uniqueness: true
end
