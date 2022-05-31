class Loans::Upload::ValidateFileType
  include Interactor

  def call
    context.fail!(message: 'Inappropriate file type') if context.file[:type] != 'text/csv'
  end
end
