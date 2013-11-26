class Refund < ActiveRecord::Base
  belongs_to :job
  attr_accessible :amount, :code, :deposit_date, :job_id
end
