class Message < ActiveRecord::Base
  validates :content, presence: true, length: { maximum: 28 }
end
