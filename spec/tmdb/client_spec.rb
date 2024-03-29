describe Tmdb::Client do

  subject { described_class.new }

  let(:options) { { mode: MOCK } }

  before(:all) do
    Tmdb.configure do |config|
      config.api_token = "sample_token"
      config.domain = "sample_domain"
    end
  end

  it "has a version number" do
    expect(Tmdb::VERSION).to_not be_nil
  end

  describe "attributes" do
    it { is_expected.to respond_to(:adapter) }
  end

  describe "#guest_session" do

    let!(:request) { Tmdb::Authentication::GuestSession::Request.new(options) }

    before do
      allow(Tmdb::Authentication::GuestSession::Request).to receive(:new) { request }
    end

    it "executes the request" do
      expect(request).to receive(:execute).with(subject.adapter)
      subject.guest_session(options)
    end

  end

  describe "#token" do

    let!(:request) { Tmdb::Authentication::Token::Request.new(options) }

    before do
      allow(Tmdb::Authentication::Token::Request).to receive(:new) { request }
    end

    it "executes the request" do
      expect(request).to receive(:execute).with(subject.adapter)
      subject.token(options)
    end

  end

  describe "#session" do

    let!(:request) { Tmdb::Authentication::Session::Request.new(options) }
    let(:token) { "afad3b67a8575221d4763f6130c3079709819bc0" }

    before do
      allow(Tmdb::Authentication::Session::Request).to receive(:new) { request }
    end

    it "executes the request" do
      expect(request).to receive(:execute).with(subject.adapter)
      subject.session(options)
    end

  end

  describe "#movie_certifications" do

    let!(:request) { Tmdb::Certification::Movie::Request.new(options) }

    before do
      allow(Tmdb::Certification::Movie::Request).to receive(:new) { request }
    end

    it "executes the request" do
      expect(request).to receive(:execute).with(subject.adapter)
      subject.movie_certifications(options)
    end

  end

end
