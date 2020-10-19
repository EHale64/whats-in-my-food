require 'rails_helper'

RSpec.describe FoodService do
  it "returns food data" do
    ingredient = 'Sweet Potatoes'

    search =  FoodService.foods_data(ingredient)
    food_data = search.first

    expect(search).to be_an(Array)
    expect(food_data).to be_a(Hash)

    expect(food_data).to have_key(:gtinUpc)
    expect(food_data[:gtinUpc]).to be_a(String)

    expect(food_data).to have_key(:description)
    expect(food_data[:description]).to be_a(String)

    expect(food_data).to have_key(:brandOwner)
    expect(food_data[:brandOwner]).to be_a(String)

    expect(food_data).to have_key(:ingredients)
    expect(food_data[:ingredients]).to be_a(String)
  end
end
