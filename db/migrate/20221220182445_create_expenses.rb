class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :name
      t.integer :amount
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :category, null: false, foreign_key: { to_table: :categories }
      t.date :date_of_expense
      t.timestamps
    end

    add_index :expenses, :name
  end
end
