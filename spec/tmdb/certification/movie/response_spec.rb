describe Tmdb::Certification::Movie::Response do

  subject { described_class.new(request, response) }

  let(:request) { double("request") }
  let(:response) { Tmdb::Payload.new(Tmdb::Certification::Movie::Mock.pass) }

  describe "#certifications" do

    it "returns certifications" do
      expect(subject.certifications).to eq(response.content["certifications"])
    end

  end

end
