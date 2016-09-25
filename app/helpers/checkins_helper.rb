module CheckinsHelper

  def static_map_for(checkin, options = {})
    params = {
      :center => [checkin.latitude, checkin.longitude].join(","),
      :zoom => 15,
      :size => "500x500",
      :markers => [checkin.latitude, checkin.longitude].join(","),
      :sensor => true
      }.merge(options)

    query_string =  params.map{|k,v| "#{k}=#{v}"}.join("&")
    image_tag "http://maps.googleapis.com/maps/api/staticmap?#{query_string}", :alt => checkin.name
  end

end
