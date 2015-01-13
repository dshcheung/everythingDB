class Restaurant < ActiveRecord::Base
  serialize :tags, Array
  serialize :acceptedpayment, Array
  serialize :description, Array
end
