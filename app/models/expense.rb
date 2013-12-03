class Expense < ActiveRecord::Base
	before_create :default_values
	before_update :default_values

	attr_accessible :expense_category_id, :expense_type_id, :user_id,  
	:job_id, :date, :expense_invoice, :file1, :file2, :file3, :location,
	 :iva, :subtotal, :total, :usd_aop, :desc, :refund_id, :other_taxes,
	  :tip

	belongs_to :job
	belongs_to :expense_category
	belongs_to :expense_type
	belongs_to :user
	belongs_to :refund
	
	mount_uploader :file1, FileUploader
	mount_uploader :file2, FileUploader
	mount_uploader :file3, FileUploader


	def default_values
		self.usd_aop = self.total / Setting.last.usd
	end
end
