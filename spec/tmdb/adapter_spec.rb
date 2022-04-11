describe Tmdb::Adapter do

  Tmdb.configure do |config|
    config.api_token = "sample_token"
    config.domain = "sample_domain"
  end

  subject { described_class.build }

  describe "attributes" do
    it { is_expected.to respond_to(:api_key) }
    it { is_expected.to respond_to(:api_token) }
    it { is_expected.to respond_to(:domain) }
  end

  let(:resource) { "/3/authentication/token/new" }
  let(:params) { {} }
  let(:http_party_response) {
    double(
      "http_party_response",
      code: code,
      headers: headers,
      body: body,
      parsed_response: JSON.parse(body)
    )
  }
  let(:body) { "{\"success\":true,\"expires_at\":\"2022-04-11 19:11:14 UTC\"}" }
  let(:headers) { { "date" => ["Mon, 11 Apr 2022 17:50:00 GMT"], "expires" => ["-1"] } }

  describe "#execute" do

    before do
      allow(subject.class).to receive(:get) { http_party_response }
      allow(subject.class).to receive(:post) { http_party_response }
    end

    context ":get" do

      context "happy" do

        let(:code) { 200 }

        it "returns payload" do
          payload = subject.execute(:get, resource, params)

          expect(payload.class).to be(Tmdb::Payload)
          expect(payload.error_code).to be_nil
          expect(payload.error_message).to be_nil
          expect(payload.code).to eq(200)
          expect(payload.content).to eq(http_party_response.parsed_response)
        end

      end

      context "when 401" do

        let(:code) { 401 }

        it "raises exception" do
          expect { subject.execute(:get, resource, params) }.to raise_error(Tmdb::Exception, "HTTP #{code}: Unauthorized")
        end

      end

      context "when 403" do

        let(:code) { 403 }

        it "raises exception" do
          expect { subject.execute(:get, resource, params) }.to raise_error(Tmdb::Exception, "HTTP #{code}: Access denied")
        end

      end

      context "when 404" do

        let(:code) { 404 }

        it "raises exception" do
          expect { subject.execute(:get, resource, params) }.to raise_error(Tmdb::Exception, "HTTP #{code}: Error finding resource")
        end

      end

      context "when 429" do

        let(:code) { 429 }

        it "raises exception" do
          expect { subject.execute(:get, resource, params) }.to raise_error(Tmdb::Exception, "HTTP #{code}: Rate limit exceeded")
        end

      end

      context "when 500" do

        let(:code) { 500 }

        it "raises exception" do
          expect { subject.execute(:get, resource, params) }.to raise_error(Tmdb::Exception, "HTTP #{code}: Error when processing request")
        end

      end

    end

    context ":post" do

      context "when 401" do

        let(:code) { 401 }

        it "raises exception" do
          expect { subject.execute(:post, resource, params) }.to raise_error(Tmdb::Exception, "HTTP #{code}: Unauthorized")
        end

      end

      context "when 403" do

        let(:code) { 403 }

        it "raises exception" do
          expect { subject.execute(:post, resource, params) }.to raise_error(Tmdb::Exception, "HTTP #{code}: Access denied")
        end

      end

      context "when 404" do

        let(:code) { 404 }

        it "raises exception" do
          expect { subject.execute(:post, resource, params) }.to raise_error(Tmdb::Exception, "HTTP #{code}: Error finding resource")
        end

      end

      context "when 429" do

        let(:code) { 429 }

        it "raises exception" do
          expect { subject.execute(:post, resource, params) }.to raise_error(Tmdb::Exception, "HTTP #{code}: Rate limit exceeded")
        end

      end

      context "when 500" do

        let(:code) { 500 }

        it "raises exception" do
          expect { subject.execute(:post, resource, params) }.to raise_error(Tmdb::Exception, "HTTP #{code}: Error when processing request")
        end

      end

    end

    context "invalid http action" do

      it "raises exception" do
        expect { subject.execute(:asdf, resource, params) }.to raise_error(Tmdb::Exception, "Invalid HTTP method provided")
      end

    end

    context "when request times out" do

      before do
        allow(subject.class).to receive(:get).and_raise(Timeout::Error)
      end

      it "raises exception" do
        expect { subject.execute(:get, resource, params) }.to raise_error(Tmdb::Exception)
      end

    end

  end

end
