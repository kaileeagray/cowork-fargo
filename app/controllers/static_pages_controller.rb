class StaticPagesController < ApplicationController
  def home
    @checkins = Checkin.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@checkins) do |checkin, marker|
      marker.lat checkin.latitude
      marker.lng checkin.longitude
      marker.infowindow render_to_string(partial: "/maps/map_box", locals: { checkin: checkin })
    end
  end

  def about
  end
end
