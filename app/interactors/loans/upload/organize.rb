class Loans::Upload::Organize
  include Interactor::Organizer

  organize Loans::Upload::ValidateFileType,
           Loans::Upload::SetParsedFile,
           Loans::Upload::ValidateFileContent,
           Loans::Upload::CreateLoans,
           Loans::Upload::LogFile
end
