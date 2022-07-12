require 'youtube_to_rss/version'

module YoutubeToRss
  class Error < StandardError; end

  class << self
    def convert(url)
      url = remove_query_strings(url)
      base_url = 'https://www.youtube.com/feeds/videos.xml?'

      if url.include?('/channel/')
        "#{base_url}channel_id=#{extract_param(url, '/channel/')}"
      elsif url.include?('/c/')
          "#{base_url}channel_id=#{extract_param(url, '/c/')}"
      elsif url.include?('/user/')
        "#{base_url}user=#{extract_param(url, '/user/')}"
      else
        raise 'URL should have "channel" or "c" or "user" param.'
      end
    end

    private

    def extract_param(url, param)
      url.split(param).last
    end

    def remove_query_strings(url)
      url.split('?').first.split('&').first
    end
  end
end
