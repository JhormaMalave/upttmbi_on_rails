class UserCareer < ApplicationRecord
  belongs_to :user
  belongs_to :career

  validates :user_id, presence: true, uniqueness: { scope: :career_id }
end
