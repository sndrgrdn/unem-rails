puts "Scraping Konbu Streetfood: Start"
doc = Nokogiri::HTML(open('http://konbustreetfood.nl/'))
food_menus = doc.css('#frioul-menu .tab-pane')

c = City.find_or_create_by(name: 'Groningen')
puts "Found city: #{c.name}"

r = Restaurant.create(name: 'Konbu Streetfood', website: 'http://konbustreetfood.nl/', facebook: 'https://www.facebook.com/konbustreetfood/', city: c)
puts "Created Restaurant: #{r.name}"

food_menus.each do |menu|
  m = Menu.create(name: menu.css('h2').text.strip, restaurant: r)
  puts "Created food-menu: #{m.name}"

  menu.css('tr').each do |dish|
    title = dish.css('strong')[0]
    price = dish.css('td')[1]
    title = title.nil? ? '' : title.text
    price = price.nil? ? '' : price.text
    d = Dish.create(name: title.strip.capitalize, price: price, menu: m)
    puts "Created dish: #{d.name}"

    ingredients = dish.css('td')[0].xpath('text()').text.split(',')
    ingredients = ingredients + ingredients.pop.split(' and ') if ingredients.size > 1

    ingredients.each do |ingredient|
      Ingredient.create(name: ingredient.strip.capitalize, dish: d)
    end
  end
end

bev_menus = doc.css('#beverages-section .tab-pane')

bev_menus.each do |menu|
  m = Menu.create(name: menu.css('h2').text.strip, restaurant: r)
  puts "Created beverage-menu: #{m.name}"

  menu.css('tr').each do |dish|
    title = dish.css('td')[0].text
    price = dish.css('td')[1].text
    d = Dish.create(name: title.strip.capitalize, price: price, menu: m)
    puts "Created dish: #{d.name}"
  end
end

d1 = r.menus.find_by(name: 'Ramen').dishes.find_by(name: 'Extra topping').id
d2 = r.menus.find_by(name: 'Ramen').dishes.last.id

puts "Deleting Extra Topping Between #{d1} and #{d2}"
r.menus.find_by(name: 'Ramen').dishes.where(id: [d1..d2]).destroy_all

puts "Renaming Snacks"
r.menus.first.update(name: 'TASTY SNACKS', slug: 'tasty-snacks')

puts "Done"
