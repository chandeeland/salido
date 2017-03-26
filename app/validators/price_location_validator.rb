class PriceBrandValidator < ActiveModel::Validator
  def validate(price)
    [
      price.menu_item.location_id == price.location_id,
      (price.day_part.nil? || price.day_part.location_id == price.location_id)
    ].all?
  end
end
