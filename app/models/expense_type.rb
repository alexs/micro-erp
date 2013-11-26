class ExpenseType < ActiveRecord::Base
	before_create :default_values
	before_update :default_values

	belongs_to :user
	belongs_to :expense_category
	attr_accessible :name, :expense_category_id


	validates_presence_of :name, :expense_category_id
	validates_uniqueness_of :name, scope: :expense_category_id, :case_sensitive => false

	def default_values
		self.name = self.name.capitalize
	end
end
