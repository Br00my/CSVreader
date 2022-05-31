class Loans::Upload::CreateLoans
  include Interactor

  def call
    rows = context.parsed_file.worksheets[0]
    rows.each do |row|
      cells = row.cells
      uniq_number = cells[0].value
      principal = cells[1].value
      annual_rate = cells[2]&.value

      Loan.create!(uniq_number: uniq_number, principal: principal, annual_rate: annual_rate)
    end
  end
end
