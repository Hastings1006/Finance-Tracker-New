class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.string :description
      t.references :category, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.datetime :transaction_date

      t.timestamps
    end
  end
end
