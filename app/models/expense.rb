class Expense < ActiveRecord::Base
  belongs_to :job
  belongs_to :expense_category
  belongs_to :expense_type
  belongs_to :user
  attr_accessible :date, :expense_code, :file1, :file2, :file3, :invoice, :iva, :subtotal, :total, :usd_aop
end
