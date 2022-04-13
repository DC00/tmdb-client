describe Tmdb::Authentication::ValidateLogin::Response do

  subject { described_class.new(request, response) }

  let(:request) { double("request") }
  let(:response) { Tmdb::Payload.new(Tmdb::Authentication::ValidateLogin::Mock.pass) }

  describe "#success" do

    it "returns true" do
      expect(subject.success).to eq(true)
    end

  end

  describe "#expires_at" do

    it "returns expires_at" do
      expect(subject.expires_at).to eq(response.content["expires_at"])
    end

  end

  describe "#request_token" do

    it "returns request_token" do
      expect(subject.request_token).to eq(response.content["request_token"])
    end

  end

end
