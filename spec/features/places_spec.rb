require 'rails_helper'

describe "Places" do
	it "if one is returned by the API, it is shown at the page" do
		allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
			[ Place.new( name:"Oljenkorsi", id: 1) ]
			)

		visit places_path
		fill_in('city', with:'kumpula')
		click_button "Search"

		expect(page).to have_content "Oljenkorsi"
	end

	it "if many are returned by the API, they are shown at the page" do
		visit places_path
		fill_in('city', with:'helsinki')
		click_button "Search"

		expect(page).to have_content @places
	end

	it "if nothing is returned by the API, a notice is shown" do
		visit places_path
		fill_in('city', with:'porvoo')
		click_button "Search"

		expect(page).to have_content :notice
	end
end