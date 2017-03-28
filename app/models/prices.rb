module Salido
  module Models
    module Price < ActiveRecord::Base
      belongs_to :brand
      belongs_to :menu_item
      belongs_to :price_level

      validates :brand_id, presence: true
      validates :menu_item_id, presence: true
      validates :price_level_id, presence: true

      validates_with PriceBrandValidator
    end
  end
end
