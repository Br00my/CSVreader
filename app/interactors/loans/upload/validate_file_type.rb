class Loans::Upload::ValidateFileType
  include Interactor

  def call
    context.fail!(message: 'Inappropriate file type') if context.file.content_type != 'text/csv'
  end
end
