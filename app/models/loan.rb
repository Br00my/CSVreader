class Loan < ApplicationRecord
  DEFAULT_ANNUAL_RATE = 44

  validates :uniq_number, :principal, :annual_rate, presence: true
  validates :uniq_number, uniqueness: true

  before_validation :set_annual_rate
  after_validation :set_interest

  private

  def set_annual_rate
    return if self.annual_rate

    self.annual_rate = DEFAULT_ANNUAL_RATE
  end

  def set_interest
    self.interest = (self.principal / 100.to_f * self.annual_rate).round(2)
  end
end
