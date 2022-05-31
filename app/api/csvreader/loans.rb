class Csvreader::Loans < Grape::API
  desc 'Read csv file'
  params do
    requires :file, type: Rack::Multipart::UploadedFile
  end
  post 'loans/upload' do
    binding.pry
    result = Loans::Upload::Organize.call(file: params[:file])

    if result.success?
      status 201
    else
      error!({ error: result.message }, 422)
    end
  end

  add_swagger_documentation \
    mount_path: 'swagger/loans',
    info: {
      'title': 'Loan resource'
    }
end
