class PriceBrandValidator < ActiveModel::Validator
  def validate(price)
    [
      price.price_level.brand_id == price.brand_id,
      price.menu_item.brand_id == price.brand_id
    ].all?
  end
end
