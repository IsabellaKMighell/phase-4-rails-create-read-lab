class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.float :total
      t.references :transactor, foreign_key: { to_table: :users }
      t.references :transactee, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
