require 'rails_helper'

describe "Ratings page" do
  it "should not have any before been created" do
    visit ratings_path
    expect(page).to have_content 'List of ratings'
    expect(page).to have_content 'Number of ratings: 0'

  end

  describe "when ratings exists" do
    before :each do
      user = FactoryGirl.create(:user)
      beer = FactoryGirl.create(:beer, name:"Kalja", style:"Lager")
      FactoryGirl.create(:rating, beer: beer, score: 25, user:user)

      visit ratings_path
    end

    it "lists the ratings and their total number" do
      expect(page).to have_content "Number of ratings: 1"
      expect(page).to have_content "Kalja"
      expect(page).to have_content "25"
    end

  end
end
