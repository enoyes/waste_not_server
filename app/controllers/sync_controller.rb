class SyncController < ApplicationController
  before_action :authenticate_with_token!

  def sync_data
    last_sync = DateTime.iso8601(params[:last_sync])

    send_locations = @current_user.group.locations.where(["locations.created_at > ?", last_sync])

    send_food_items = @current_user.group.food_items.where(["food_items.updated_at > ?", last_sync])

    send_group_members = @current_user.group.users.where(["users.updated_at > ?", last_sync])

    new_food_items = params[:food_items]

    new_food_items.each do |k, v|

      fi = FoodItem.find_by(f_id: v[:f_id])
      if fi
        fi.desc = v[:desc]
        fi.purchased = v[:purchased]
        fi.expiration = v[:expiration]
        fi.size_value = v[:size_value]
        fi.size_unit = v[:size_unit]
        fi.remaining = v[:remaining]
        fi.public = v[:public]
        fi.location = v[:location]
        fi.deleted = v[:deleted]
        fi.save
      else
        fi = FoodItem.new(f_id: v[:f_id], name: v[:name], desc: v[:desc], purchased: v[:purchased], expiration: v[:expiration], size_value: v[:size_value], size_unit: v[:size_unit], remaining: v[:remaining], public: v[:public], deleted: v[:deleted])
        fi.location_id = v[:location]
        fi.user = @current_user
        fi.save
      end

    end

    render json: {locations: send_locations, food_items: send_food_items, group_members: send_group_members}



  end


end
