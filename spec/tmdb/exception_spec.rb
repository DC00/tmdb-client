describe Tmdb::Exception do

  subject { described_class.new(message, context) }

  let(:message)   { "test_error_message" }
  let(:context)   { { code: 401, request: params, response: response } }
  let(:params)    { { "request" => "request" } }
  let(:response)  { '{ "response": "json", "error_code": 999 }' }

  it { is_expected.to respond_to(:context) }

  describe "#code" do

    it "returns error code" do
      expect(subject.code).to eq(401)
    end

  end

  describe "#request" do

    it "returns request" do
      expect(subject.request).to eq(params)
    end

  end

  describe "#response" do

    it "returns response" do
      expect(subject.response).to eq(JSON.parse(response))
    end

    context "when bad JSON" do

      let(:context)   { { code: 401, request: params, response: response2 } }
      let(:response2) { { "response2" => "json" } }

      it "returns empty hash" do
        expect(subject.response).to eq({})
      end

    end

  end

  describe "#error_code" do

    it "returns error code" do
      expect(subject.error_code).to eq(999)
    end

  end

end
