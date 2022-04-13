describe Tmdb::Authentication::ValidateLogin::Request do

  subject { described_class.new(options) }

  let(:options) { {
    mode: mode,
    username: "sample_username",
    password: "sample_password",
    request_token: "sample_request_token"
  } }

  Tmdb.configure do |config|
    config.api_token = "sample_token"
    config.domain = "sample_domain"
  end

  describe "#execute" do

    context "when happy" do
      let(:mode) { PRODUCTION }
      let(:adapter) { Tmdb::Adapter.build }
      let(:http_party_response) {
        double(
          "http_party_response",
          code: 200,
          headers: headers,
          body: body,
          parsed_response: JSON.parse(body)
        )
      }
      let(:body) { "{\"success\":true,\"expires_at\":\"2022-04-11 19:11:14 UTC\"}" }
      let(:headers) { { "date" => ["Mon, 11 Apr 2022 17:50:00 GMT"], "expires" => ["-1"] } }

      before do
        allow(adapter).to receive(:execute) { Tmdb::Payload.new(http_party_response) }
      end

      it "has correct url" do
        expect(adapter).to receive(:execute).with(:post, VALIDATE_LOGIN_URL, options)
        subject.execute(adapter)
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

        expect(response.success?).to eq(true)
        expect(response.success).to eq(false)
        expect(response.error_code).to eq(6)
      end

    end

    context "when mock_pass" do

      let(:mode) { MOCK }

      it "returns mock pass response" do
        response = subject.execute(Tmdb::Adapter.new)

        expect(response.success?).to eq(true)
        expect(response.success).to eq(true)
        expect(response.request_token).to be_present
        expect(response.expires_at).to be_present
        expect(response.error_code).to be_nil
      end

    end

  end

end
