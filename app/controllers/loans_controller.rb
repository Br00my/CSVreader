class LoansController < ActionController::Base
  def index
    @loans = Loan.all
  end
end
