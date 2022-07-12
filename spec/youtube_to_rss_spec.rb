RSpec.describe YoutubeToRss do
  it "has a version number" do
    expect(YoutubeToRss::VERSION).not_to be nil
  end

  describe '.convert' do
    let(:rss_link) { YoutubeToRss.convert(url) }

    context 'when channel param is present' do
      let!(:url) { 'https://www.youtube.com/channel/abc123xyz321' }

      it do
        expect(rss_link).to eq 'https://www.youtube.com/feeds/videos.xml?channel_id=abc123xyz321'
      end
    end

    context 'when c param is present' do
      let!(:url) { 'https://www.youtube.com/c/abc123xyz321' }

      it { expect(rss_link).to eq 'https://www.youtube.com/feeds/videos.xml?channel_id=abc123xyz321' }
    end

    context 'when user param is present' do
      let!(:url) { 'https://www.youtube.com/user/foo' }

      it { expect(rss_link).to eq 'https://www.youtube.com/feeds/videos.xml?user=foo' }
    end

    context 'when user or channel params are not present' do
      let!(:url) { 'https://www.youtube.com/hahaha/rofl' }

      it { expect{ rss_link }.to raise_error(StandardError, 'URL should have channel or user param.') }
    end
  end

  describe 'private methods' do
    describe '.remove_query_strings' do
      let!(:url_1) { 'https://foo.com?bar&id=foo' }
      let!(:url_2) { 'https://foo.com&bar?id=foo' }

      it do
        expect(YoutubeToRss.send(:remove_query_strings, url_1)).to eq 'https://foo.com'
        expect(YoutubeToRss.send(:remove_query_strings, url_2)).to eq 'https://foo.com'
      end
    end

    describe '.extract_param' do
      let(:url) { 'https://site.com/param/something'}
      let(:param) { '/param/' }
      it do
        expect(YoutubeToRss.send(:extract_param, url, param)).to eq 'something'
      end
    end
  end
end
