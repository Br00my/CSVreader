class Loans::Upload::ValidateFileContent
  include Interactor

  def call
    sheet = context.parsed_file.worksheets[0]
    sheet.each do |row|
      if row.cells[0].value.blank? || row.cells[1].value.blank?
        context.fail!(message: 'Unique number or principal was not added')
      end
    end
  end
end
