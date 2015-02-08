require 'rails_helper'

describe "Beer" do

  it "is added if name is not empty" do
    visit new_beer_path
    fill_in("beer_name", with:"Kalja")

    expect{
      click_button("Create Beer")
    }.to change{Beer.count}.by(1)
  end

  it "is not added and error message is displayed if name is empty" do
    visit new_beer_path
    fill_in("beer_name", with:"")

    expect{
      click_button("Create Beer")
    }.to change{Beer.count}.by(0)
    click_button("Create Beer")
    expect(current_path).to eq(beers_path)
    expect(page).to have_content "Name can't be blank"
  end
end
