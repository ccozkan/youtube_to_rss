RSpec.describe YoutubeToRss do
  it "has a version number" do
    expect(YoutubeToRss::VERSION).not_to be nil
  end

  describe '.convert' do
    context do 'when channel_id param is present'
      let!(:url) { 'https://www.youtube.com/channel/abc123xyz321' }

      it do
        rss_link = YoutubeToRss.convert(url)
        expect(rss_link).to eq 'https://www.youtube.com/feeds/videos.xml?channel_id=abc123xyz321'
      end
    end

    context do 'when user param is present'
      let!(:url) { 'https://www.youtube.com/user/foo'}

      it do
        rss_link = YoutubeToRss.convert(url)
        expect(rss_link).to eq 'https://www.youtube.com/feeds/videos.xml?user=foo'
      end
    end
  end
end
