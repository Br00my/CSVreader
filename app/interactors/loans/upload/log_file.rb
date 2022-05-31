class Loans::Upload::LogFile
  include Interactor

  def call
    logger = Logger.new("#{Rails.root}/log/file-processed.log")
    logger.error("#{context.original_filename} at #{Time.now}")
  end
end
