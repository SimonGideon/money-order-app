class CreateMoneyOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :money_orders, id: :string do |t|
      t.string :name
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.float :amount
      t.datetime :created_at
    end

    reversible do |dir|
      dir.up do
        execute <<-SQL
          CREATE SEQUENCE money_orders_id_seq START 1 OWNED BY money_orders.id;
        SQL
        execute <<-SQL
          ALTER TABLE money_orders ALTER COLUMN id SET DEFAULT 'TRSC00AD' || nextval('money_orders_id_seq');
        SQL
      end

      dir.down do
        execute <<-SQL
          ALTER TABLE money_orders ALTER COLUMN id DROP DEFAULT;
        SQL
        execute <<-SQL
          DROP SEQUENCE money_orders_id_seq;
        SQL
      end
    end
  end
end
