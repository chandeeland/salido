class PriceBrandValidator < ActiveModel::Validator
  def validate(price)
    [
      price.location.brand_id == price.brand_id,
      price.order_type.brand_id == price.brand_id
    ].all?
  end
end
