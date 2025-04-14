class CreateMoneyOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :money_orders do |t|
      t.string :name
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.float :amount
      t.datetime :created_at
    end
  end
end