require 'rails_helper'

describe "User page" do

  before :each do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user, username:"Jaakko", password:"Foobar1", password_confirmation:"Foobar1")
    beer = FactoryGirl.create(:beer, name:"Kalja", style:"Lager")
    beer2 = FactoryGirl.create(:beer, name:"Bisse", style:"Lager")
    FactoryGirl.create(:rating, beer: beer, score: 25, user: user)
    FactoryGirl.create(:rating, beer: beer2, score: 25, user: user2)
  end

  it "should only display selected user's ratings" do
    visit user_path(:user)
    expect(page).to have_content :beer_name
    expect(page).not_to have_content "Bisse"
  end

  
end
