module ApplicationHelper
  def driving_directions_link(user, location)
    "https://maps.google.com?saddr=#{user.latitude},#{user.longitude}&daddr=#{location.latitude},#{location.longitude}"
  end

  def last_wait_time(location)
    location.wait.empty? ? "Unknown" : "#{location.wait}"
  end
end
