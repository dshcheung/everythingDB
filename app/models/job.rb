class Job < ActiveRecord::Base
  belongs_to :employer
  validates :jobsdb_id, :uniqueness => true
  serialize :position_about, Hash
end
