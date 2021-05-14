class Period < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :start, presence: true
  validates :status, inclusion: {in: [true, false]}


  def self.search(paramns = {})
    periods = Period.all
    periods = periods.where(status: paramns[:status]) if paramns[:status].present?

    periods
  end
end
