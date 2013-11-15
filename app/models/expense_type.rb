class ExpenseType < ActiveRecord::Base
  belongs_to :user
  belongs_to :expense_category
  attr_accessible :name
end
