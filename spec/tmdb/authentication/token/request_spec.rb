describe Tmdb::Authentication::Token::Request do

  subject { described_class.new(options) }

  let(:options) { { mode: mode } }

  describe "#execute" do

    before do
      Tmdb.configure do |config|
        config.api_token = "sample_token"
        config.domain = "sample_domain"
      end
    end

    context "when mock_vendor_fail" do

      let(:mode) { MOCK_VENDOR_FAIL }

      it "raises exception" do
        expect { subject.execute(Tmdb::Adapter.build) }.to raise_error(Tmdb::Exception, "HTTP 001: Mocked failure")
      end

    end

    context "when mock_fail" do

      let(:mode) { MOCK_FAIL }

      it "returns mock fail response" do
        response = subject.execute(Tmdb::Adapter.build)

        expect(response.success?).to be_falsey
        expect(response.error_code).to eq(7)
      end

    end

    context "when mock_pass" do

      let(:mode) { MOCK }

      it "returns mock pass response" do
        response = subject.execute(Tmdb::Adapter.new)

        expect(response.success?).to be_truthy
        expect(response.success).to eq("true")
        expect(response.request_token).to be_present
        expect(response.expires_at).to be_present
        expect(response.error_code).to be_nil
      end

    end

  end

end
