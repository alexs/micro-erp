class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.references :job
      t.references :expense_category
      t.references :expense_type
      t.string :location
      t.date :date
      t.string :expense_invoice
      t.decimal :subtotal
      t.decimal :iva
      t.decimal :other_taxes
      t.decimal :tip
      t.decimal :total
      t.decimal :usd_aop
      t.string :refund_voucher
      t.date :refund_date
      t.string :file1
      t.string :file2
      t.string :file3
      t.text :desc
      t.references :user

      t.timestamps
    end
    add_index :expenses, :job_id
    add_index :expenses, :expense_category_id
    add_index :expenses, :expense_type_id
    add_index :expenses, :user_id
  end
end
