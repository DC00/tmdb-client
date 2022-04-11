describe Tmdb::Payload do

  subject { described_class.new(http_party_response) }

  let(:http_party_response) {
    double(
      "http_party_response",
      code: 401,
      parsed_response: parsed_response,
      headers: headers
    )
  }
  let(:parsed_response) { {
    "status_code" => 7,
    "status_message" => "Invalid API key: You must be granted a valid key."
  } }
  let(:headers) { { "date" => ["Mon, 11 Apr 2022 17:50:00 GMT"], "expires" => ["-1"] } }

  describe "attributes" do
    it { is_expected.to respond_to(:code) }
    it { is_expected.to respond_to(:content) }
    it { is_expected.to respond_to(:headers) }
  end

  describe "#error_code" do

    it "returns status_code" do
      expect(subject.error_code).to eq(7)
    end

  end

  describe "#error_message" do

    it "returns status_message" do
      expect(subject.error_message).to eq(parsed_response["status_message"])
    end

  end

end
