describe Tmdb::Client do

  subject { described_class.new }

  before(:all) do
    Tmdb.configure do |config|
      config.api_token = "sample_token"
      config.domain = "sample_domain"
    end
  end

  it { is_expected.to respond_to(:adapter) }

  it "has a version number" do
    expect(Tmdb::VERSION).to_not be_nil
  end

  describe "#token" do

    let!(:request) { Tmdb::Token::Request.new({ mode: MOCK }) }

    before do
      allow(Tmdb::Token::Request).to receive(:new) { request }
    end

    it "executes the request" do
      expect(request).to receive(:execute).with(subject.adapter)
      subject.token
    end

  end

end
