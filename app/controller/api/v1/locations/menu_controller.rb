module Api
  module V1
    class LocationController < ApplicationController

      def menu
        @all_items = Price.where(
          location_id: params(:location_id),
          order_type_id: params(:order_type)
        )

        day_part = DayPart.find(params(:day_part_id)) || current_day_part(params(:location_id))

        menu_items(nil)
          .merge(menu_items(day_part))
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

      def current_day_part(location_id)
        hour = (Time.now.wday * 24) + Time.now.hour
        DayPartSchedule.where(
          location_id: location_id,
          hour_of_week: hour
        ).first
      end

    end
  end
end
