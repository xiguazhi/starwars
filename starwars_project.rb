#!/usr/local/bin/ruby -w
require 'json'
require 'uri'
require 'rubygems'
require 'net/http'

def get_objects(url)
  Net::HTTP.get(URI.parse(url))
end
url = 'https://swapi.co/api/starships/?page='
get_starships = 'https://swapi.co/api/starships/'
init_starships = get_objects(get_starships)
init_data = JSON.parse(init_starships)
count = init_data['count']
items = count.to_i
i = 1
page = 1
while page <= 4
  starships = get_objects(url + page.to_s)
  data = JSON.parse(starships)
  page += 1
  while i < 10
    puts i
    star_url = data['results'][i]['url']
    starship_url = get_objects(star_url)
	starship = JSON.parse(starship_url)
    puts 'Starship ' + starship["name"] + ' has pilots:'
    i += 1
	parsed = JSON.parse(starship)
	ship_name = parsed["name"]
	parsed["pilots"].each do |pilot|
	  pilot_url = get_objects(pilot)
	  pilot = JSON.parse(pilot_url)
	  pilot_name = pilot["name"]
	  p pilot_name
	end
  end
  
end
puts starship + 'derp'