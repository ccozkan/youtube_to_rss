require 'youtube_to_rss/version'
require 'rest-client'
require 'nokogiri'

module YoutubeToRss
  class Error < StandardError; end

  class << self
    def convert(url)
      html = RestClient.get url
      doc = Nokogiri::HTML(html).text
      channel_id = doc.split('channel_id=').last.split('",').first
      # channel_id = doc.split('"rssUrl":"https://www.youtube.com/feeds/videos.xml?channel_id=').last.split('",').first
      base_url = 'https://www.youtube.com/feeds/videos.xml?'

      "#{base_url}channel_id=#{channel_id}"
    end
  end
end
