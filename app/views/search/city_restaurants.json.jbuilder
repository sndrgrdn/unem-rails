json.restaurants @restaurants do |res|
  json.id res.id
  json.name res.name
  json.url url_for([res.city, res])
  json.city do
    json.id res.city.id
    json.name res.city.name
    json.url url_for(res.city)
  end

end
