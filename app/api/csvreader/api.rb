class Csvreader::Api < Grape::API
  format :json

  mount Csvreader::Loans, at: 'api'
end
