class PollingLocation < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  POLLING_LOCATIONS_URL = 'http://earlyvoting.jayhill.net/api/locations'

  def self.get_current_locations(user)
    url = URI.parse(POLLING_LOCATIONS_URL)
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http| http.request(req) }
    locations = JSON.parse(res.body)

    locations.each do |location|
      location[:uid] = user.id
      PollingLocation.create(location)
      sleep(1.5)
    end
  end

  def address
    "#{street}, #{cityStateZip}"
  end
end
