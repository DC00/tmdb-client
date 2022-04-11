describe Tmdb::Request do

  subject { described_class.new(options) }

  let(:options) { {} }

  it { is_expected.to respond_to(:mode) }
  it { is_expected.to respond_to(:options) }

  it "defines #attributes" do
    expect { subject.attributes }.to raise_error(NotImplementedError)
  end

end
