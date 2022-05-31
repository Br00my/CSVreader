class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.string :uniq_number
      t.bigint :principal
      t.integer :annual_rate
      t.decimal :interest, precision: 15, scale: 2
      t.timestamps
    end
  end
end
