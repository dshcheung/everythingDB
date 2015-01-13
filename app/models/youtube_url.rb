class YoutubeUrl < ActiveRecord::Base
  validates_uniqueness_of :youtube_code
end
