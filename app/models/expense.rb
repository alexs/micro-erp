class Expense < ActiveRecord::Base
	before_create :default_values
	before_update :default_values

	#acts_as_xlsx :columns => [:id, :'date.year', :'date.month']

	attr_accessible :expense_category_id, :expense_type_id, :user_id,  
	:job_id, :date, :expense_invoice, :file1, :file2, :file3, :location,
	 :iva, :subtotal, :total, :usd_aop, :desc, :refund_id, :other_taxes,
	  :tip, :invoice_paid, :invoiced

	belongs_to :job
	belongs_to :expense_category
	belongs_to :expense_type
	belongs_to :user
	belongs_to :refund
	
	mount_uploader :file1, FileUploader
	mount_uploader :file2, FileUploader
	mount_uploader :file3, FileUploader

	scope :filter_by_job_id, lambda { |value| where('job_id > (?)', value) if !value.blank? }
	scope :filter_by_user_id, lambda { |value| where('user_id = (?)', value) if !value.blank? }
	scope :filter_by_category_id, lambda { |value| where('expense_category_id = (?)', value) if !value.blank? }

	def self.filter_by_date(from_date,to_date)
		if !from_date.blank? && !to_date.blank?
			Expense.where("date between ? and ?",from_date.to_date,to_date.to_date)
		else
			self			
		end
	end

	def default_values
		self.usd_aop = self.total / Setting.last.usd
	end
end

