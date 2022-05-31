require 'rails_helper'

RSpec.describe Loans::Upload::Organize do
  describe '.call' do
    context 'with valid file type' do
      context 'with valid content' do
        it 'creates loans' do
          file_open = File.open("#{Rails.root}/spec/files/valid_test_file.csv")
          file = { filename: 'valid_test_file.csv', type: 'text/csv', tempfile: file_open }
          expect { Loans::Upload::Organize.call(file: file) }.to change(Loan, :count).by(20)
        end
      end

      context 'with invalid content' do
        it 'does not create loans' do
          file_open = File.open("#{Rails.root}/spec/files/invalid_test_file.xlsx")
          file = { filename: 'invalid_test_file.csv', type: 'text/csv', tempfile: file_open }
          expect { Loans::Upload::Organize.call(file: file) }.to_not change(Loan, :count)
        end
      end
    end

    context 'with invalid type' do
      it 'does not create loans' do
        file_open = File.open("#{Rails.root}/spec/files/valid_test_file.csv")
        file = { filename: 'valid_test_file.csv', type: 'text/plain', tempfile: file_open }
        expect { Loans::Upload::Organize.call(file: file) }.to_not change(Loan, :count)
      end
    end
  end
end
