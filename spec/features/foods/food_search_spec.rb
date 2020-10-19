require 'rails_helper'

RSpec.describe 'Food Search' do
  it "should bring up a list of foods for an ingredient" do
    visit root_path

    fill_in :foods, with: 'sweet potatoes'

    click_on 'Search'

    expect(current_path).to eq(foods_path)

    expect(page).to have_content('10 Foods Found')
    expect(page).to have_css('.food', count: 10)

    within(first('.food')) do
      expect(page).to have_css('.code')
      expect(page).to have_css('.description')
      expect(page).to have_css('.brand_owner')
      expect(page).to have_css('.ingredients')
    end
  end
end
