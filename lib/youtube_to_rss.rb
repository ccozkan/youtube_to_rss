require "youtube_to_rss/version"

module YoutubeToRss
  class Error < StandardError; end
  class << self
    def convert(url)
      url = remove_query_strings(url)

      if url.include?('/channel/')
        channel_id = url.split('/channel/').last
        'https://www.youtube.com/feeds/videos.xml?channel_id=' + channel_id
      elsif url.include?('/user/')
        user = url.split('/user/').last
        'https://www.youtube.com/feeds/videos.xml?user=' + user
      end
    end

    private

    def remove_query_strings(url)
      url.chomp("?").chomp("&")
    end
  end
end
