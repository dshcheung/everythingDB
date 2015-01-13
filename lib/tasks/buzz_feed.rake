namespace :buzz_feed do
  task :buzz_init => :environment do
    get_buzz_url(100)
  end

  def get_buzz_url(frequency)
    require 'open-uri'
    require 'nokogiri'

    for i in 1..frequency
      puts i

      url = "http://www.buzzfeed.com/videos?p=" + i.to_s + "&r=1"
      browser = open(url).read
      html_doc = Nokogiri::HTML(browser)

      buzz_links = html_doc.css('li.posts-list__item.lede--stacked > div:nth-child(1).lede > div:nth-child(2).lede__body > h2:nth-child(1).lede__title.lede__title--medium > a:nth-child(1).lede__link')
      buzz_links.each do |link|
        title = link.text.strip
        buzz_url = "http://www.buzzfeed.com" + link.attr('href')
        get_buzz_rendered_html(title, buzz_url)
      end
    end
  end

  def get_buzz_rendered_html(title, buzz_url)
    require 'open-uri'
    require 'nokogiri'

    browser = open(buzz_url).read
    html_doc = Nokogiri::HTML(browser)

    youtube_link = html_doc.css('#video_buzz_element_ > span > a').text
    if youtube_link.match(/youtube/)
      youtube_code = youtube_link.split("http://www.youtube.com/v/")[1]
      puts youtube_code
      create_buzz_video(title, youtube_code)
    end
  end

  def create_buzz_video(title, youtube_code)
    YoutubeUrl.create(title: title, youtube_code: youtube_code)
  end
end








