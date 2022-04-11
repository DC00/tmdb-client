describe Tmdb::Token::Request, type: :model do

  subject { described_class.new(options) }

  let(:options) { { mode: mode } }

  describe "#execute" do

    context "when MOCK_VENDOR_FAIL" do

      let(:mode) { MOCK_VENDOR_FAIL }

      it "raises exception" do
        expect { subject.execute(Tmdb::Adapter.new) }.to raise_exception(Tmdb::Exception, "HTTP 001: Mocked failure")
      end

    end

    context "when mock_fail" do

      let(:mode) { MOCK_FAIL }

      it "returns mock fail response" do
        response = subject.execute(Tmdb::Adapter.new)
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
