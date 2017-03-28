module Api
  module V1
    class LocationController < ApplicationController

      def menu
        @all_items = Product.where(
          location_id: params(:location_id),
          order_type_id: params(:order_type)
        )
        day_part = DayPart.find(params(:day_part_id))

        result = menu_items(nil)
          .merge(menu_items(day_part))
          .values

        render json: result
      end

      private

      attr_reader :all_items

      def menu_items(day_part)
        all_items
          .select { |x| x.day_part == day_part }
          .reduce({}) do |hash, curr|
            hash[curr.menu_item_id] = curr
            hash
          end
      end
    end
  end
end
