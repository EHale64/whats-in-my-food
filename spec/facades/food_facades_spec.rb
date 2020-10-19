require 'rails_helper'

RSpec.describe 'Food Facade' do
  it "returns an array of food objects for a given ingredient" do
    ingredient = 'Sweet Potatoes'

    foods =  FoodFacade.foods(ingredient)

    expect(foods).to be_an(Array)
    expect(foods.first).to be_a(Food)
    expect(foods.first.description).to be_a(String)
  end
end
