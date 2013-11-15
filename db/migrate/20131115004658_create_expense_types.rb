class CreateExpenseTypes < ActiveRecord::Migration
  def change
    create_table :expense_types do |t|
      t.string :name
      t.references :user
      t.references :expense_category

      t.timestamps
    end
    add_index :expense_types, :user_id
    add_index :expense_types, :expense_category_id
  end
end
