class Career < ApplicationRecord
  has_many :subjects

  validates :name, presence: true, uniqueness: true
end
