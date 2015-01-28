class Airplane < ActiveRecord::Base

  belongs_to :airline, :counter_cache => true
end
