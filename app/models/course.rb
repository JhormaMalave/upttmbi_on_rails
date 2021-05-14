class Course < ApplicationRecord
  has_many :subjects
  has_many :sections

  enum name: ['Inicial', '1', '2', '3', '4']
end
