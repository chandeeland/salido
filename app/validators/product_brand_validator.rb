class PriceBrandValidator < ActiveModel::Validator
  def validate(product)
    [
      product.price.brand_id == product.brand_id,
      product.order_type.brand_id == product.brand_id,
      product.location.brand_id == product.brand_id
    ].all?
  end
end
