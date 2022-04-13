describe Tmdb::Authentication::GuestSession::Response do

  subject { described_class.new(request, response) }

  let(:request) { double("request") }
  let(:response) { Tmdb::Payload.new(Tmdb::Authentication::GuestSession::Mock.pass) }

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

  describe "#guest_session_id" do

    it "returns guest_session_id" do
      expect(subject.guest_session_id).to eq(response.content["guest_session_id"])
    end

  end

end
