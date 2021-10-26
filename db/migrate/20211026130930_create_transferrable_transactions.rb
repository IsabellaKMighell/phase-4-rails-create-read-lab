class CreateTransferrableTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transferrable_transactions do |t|
      t.belongs_to :transactor , null: false, foreign_key: true
      t.belongs_to :transactee , null: false, foreign_key: true
      t.float :cost
      t.string :category

      t.timestamps
    end
  end
end
