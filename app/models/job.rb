class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :job_type
  attr_accessible :name, :sold, :status_id, :user_id, :job_type_id
end
