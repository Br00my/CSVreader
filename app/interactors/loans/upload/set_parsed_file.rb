class Loans::Upload::SetParsedFile
  include Interactor

  def call
    context.parsed_file = RubyXL::Parser.parse(context.file[:tempfile])
  end
end
