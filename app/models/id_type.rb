class IdType < ApplicationRecord
  has_many :teachers

  enum name: ['V', 'P']
end
