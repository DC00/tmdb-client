describe Tmdb::Response do

  subject { described_class.new(request, response) }

  let(:request) { double("request") }
  let(:response) { double(
    "response",
    content: {},
    request: {},
    response: payload,
  ) }
  let(:payload) { double("payload", code: 200, error_code: nil, error_message: nil) }

  describe "attributes" do
    it { is_expected.to respond_to(:content) }
    it { is_expected.to respond_to(:request) }
    it { is_expected.to respond_to(:response) }

    it { is_expected.to respond_to(:code) }
    it { is_expected.to respond_to(:error_code) }
    it { is_expected.to respond_to(:error_message) }
  end

  describe "#success?" do

    before do
      allow(response).to receive(:code) { payload.code }
    end

    it "returns true" do
      expect(subject.success?).to eq(true)
    end

  end

end
