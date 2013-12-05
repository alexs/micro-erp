class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.references :job
      t.references :expense_category
      t.references :expense_type
      t.references :refund
      t.text :invoice_paid
      t.string :location
      t.date :date
      t.string :expense_invoice
      t.decimal :subtotal, :precision => 10, :scale => 2
      t.decimal :iva, :precision => 10, :scale => 2
      t.decimal :other_taxes, :precision => 10, :scale => 2
      t.decimal :tip, :precision => 10, :scale => 2
      t.decimal :total, :precision => 10, :scale => 2
      t.decimal :usd_aop, :precision => 10, :scale => 2
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
