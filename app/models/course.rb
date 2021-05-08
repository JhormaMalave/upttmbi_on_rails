class Course < ApplicationRecord
  has_many :subjects

  enum name: ['Inicial', '1', '2', '3', '4']
end
