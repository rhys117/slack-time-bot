require File.expand_path '../spec_helper.rb', __FILE__

describe "Time API" do
  it "should allow post requests to /time" do
    post '/time'
    expect(last_response).to be_ok
  end

  it "post requests to /time to current time" do
    response = post '/time'
    expect(Time.parse(response.body).round).to eq(Time.now.round)
  end
end
