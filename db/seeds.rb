# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

doc = Nokogiri::HTML(open('http://www.deburgemeestervannapels.nl/'))
menus = doc.css('.tab-pane')

c = City.create(name: 'Leeuwarden')
r = Restaurant.create(name: 'Burgemeester van Napels', city: c)

menus.each do |menu|
  m = Menu.create(name: menu['id'].capitalize, restaurant: r)

  menu.css('.dish').each do |dish|
    d = Dish.create(name: dish.css('.title').text, price: dish.css('.price').text.slice(2..6).sub(',', '.'), menu: m)
    dish.css('.dish-description').text.split(',').each do |ingredient|
      Ingredient.create(name: ingredient, dish: d)
    end
  end
end
