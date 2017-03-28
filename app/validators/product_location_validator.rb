class PriceBrandValidator < ActiveModel::Validator
  def validate(price)
    price.day_part.nil? || price.day_part.location_id == price.location_id
  end
end
