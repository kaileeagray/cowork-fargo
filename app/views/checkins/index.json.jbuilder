json.array!(@checkins) do |checkin|
  json.extract! checkin, :id, :latitude, :longitude, :name, :address, :start, :user_id
  json.url checkin_url(checkin, format: :json)
end
