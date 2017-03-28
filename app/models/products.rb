module Salido
  module Models
    module Price < ActiveRecord::Base
      belongs_to :brand
      belongs_to :prices
      belongs_to :menu_item, through: :prices
      belongs_to :price_level, through: :prices
      belongs_to :order_type
      belongs_to :location
      belongs_to :day_part

      validates :brand_id, presence: true
      validates :location_id, presence: true
      validates :price_id, presence: true
      validates :order_type_id, presence: true

      validates_with ProductBrandValidator
      validates_with ProductLocationValidator
    end
  end
end
