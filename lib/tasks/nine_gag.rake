namespace :nine_gag do
  task :gag_init => :environment do
    home_gag_url = "http://9gag.tv/"
    get_gag_json(home_gag_url, 1000)
  end

  # task :gag_update => :environment do
  #   channels = ["prank", "cute", "music", "movie-and-tv", "nsfw"]
  #   channels.each do |channel|
  #     home_gag_url = "http://9gag.tv/channel/#{channel}"
  #     get_gag_json(home_gag_url, 1)
  #   end
  # end

  def get_gag_json(home_gag_url, frequency)
    require 'open-uri'
    require 'json'

    browser = open(home_gag_url).read
    html_doc = Nokogiri::HTML(browser)

    data_index_key = html_doc.css('#jsid-video-post-grid-container').attr('data-index-key')
    data_ref_id = html_doc.css('#jsid-video-post-grid-container').attr('data-ref-id')

    inner_gag_url = "http://9gag.tv/api/index/"+ data_index_key + "?ref_key=" + data_ref_id + "&count=50&direction=1&includeSelf=1"


    for i in 1..frequency do
      puts i

      browser2 = JSON.parse open(inner_gag_url).read
      browser2["data"]["posts"].each do |post|
        if post["sourceUrl"].match(/youtube/)
          puts post["videoExternalId"]
          create_gag_video(post["ogTitle"], post["videoExternalId"])
          data_ref_id = post['hashedId']
        end
      end
      inner_gag_url = "http://9gag.tv/api/index/LJEGX?ref_key=" + data_ref_id + "&count=50&direction=1&includeSelf=0"
    end
  end

  def create_gag_video(title, youtube_code)
    YoutubeUrl.create(title: title, youtube_code: youtube_code)
  end
end








