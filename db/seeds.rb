# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


LOCATIONS_URL = 'http://earlyvoting.jayhill.net/api/earlyvotinglocations'
url = URI.parse(LOCATIONS_URL)
req = Net::HTTP::Get.new(url.to_s)
res = Net::HTTP.start(url.host, url.port) {|http| http.request(req) }
locations = JSON.parse(res.body)

locations.each do |location|
  Location.create(location)
  sleep(1.5)
end
