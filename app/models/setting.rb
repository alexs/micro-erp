class Setting < ActiveRecord::Base
  belongs_to :user
  attr_accessible :usd, :user_id
end
