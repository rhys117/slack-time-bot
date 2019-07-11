require File.expand_path '../spec_helper.rb', __FILE__

describe "Time API" do
  it "should allow post requests to /time" do
    post '/time'
    expect(last_response).to be_ok
  end

  it "post requests to /time respond with correct time" do
    response = post '/time'
    differences_in_time = Time.now - Time.parse(response.body.split('is:').last)
    expect(differences_in_time).to be_within(2).of(0)
  end
end
