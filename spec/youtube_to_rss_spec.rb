RSpec.describe YoutubeToRss do
  it 'has a version number' do
    expect(YoutubeToRss::VERSION).not_to be nil
  end

  describe '.convert' do
    let(:rss_link) { YoutubeToRss.convert(url) }
    let(:url) { 'https://www.youtube.com/@Vibin' }

    it do
      expect(rss_link).to start_with 'https://www.youtube.com/feeds/videos.xml?channel_id=UCtrHcoiynEEILOrqtGAC1Aw'
    end
  end
end
