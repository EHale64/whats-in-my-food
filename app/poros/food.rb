class Food
  attr_reader :gtin_upc, :description, :brand_owner, :ingredients

  def initialize(params)
    @gtin_upc = params[:gtinUpc]
    @description = params[:description]
    @brand_owner = params[:brandOwner]
    @ingredients = params[:ingredients]
  end
end
