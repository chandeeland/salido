module Salido
  module Models
    module Price < ActiveRecord::Base
      belongs_to :brand
      belongs_to :location
      belongs_to :menu_item
      belongs_to :order_type
      belongs_to :day_part

      has_many :order_items
      has_many :orders, through: :order_items

      validates :brand_id, presence: true
      validates :location_id, presence: true
      validates :menu_item_id, presence: true
      validates :order_type_id, presence: true

      validates_with PriceBrandValidator
      validates_with PriceLocationValidator
    end
  end
end
