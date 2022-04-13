describe Tmdb::Authentication::Session::Response do

  subject { described_class.new(request, response) }

  let(:request) { double("request") }
  let(:response) { Tmdb::Payload.new(Tmdb::Authentication::Session::Mock.pass) }

  describe "#success" do

    it "returns true" do
      expect(subject.success).to eq(true)
    end

  end

  describe "#session_id" do

    it "returns session_id" do
      expect(subject.session_id).to eq(response.content["session_id"])
    end

  end

end
