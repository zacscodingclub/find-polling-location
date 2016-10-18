module ApplicationHelper
  def driving_directions_link(user, location)
    "https://maps.google.com?saddr=#{user.latitude},#{user.longitude}&daddr=#{location.latitude},#{location.longitude}"
  end
end
