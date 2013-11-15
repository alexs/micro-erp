class Expense < ActiveRecord::Base
	attr_accessible :expense_category_id, :expense_type_id, :user_id,  :job_id, :date, :expense_code, :file1, :file2, :file3, :invoice, :iva, :subtotal, :total, :usd_aop, :desc
	belongs_to :job
	belongs_to :expense_category
	belongs_to :expense_type
	belongs_to :user
	mount_uploader :file1, FileUploader
	mount_uploader :file2, FileUploader
	mount_uploader :file3, FileUploader
end
