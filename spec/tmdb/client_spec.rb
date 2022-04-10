describe Tmdb::Client do
  it "has a version number" do
    expect(Tmdb::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end

  it "does something cool" do
    expect(Tmdb::Client.get_movies("params")).to eq("params")
  end
end

