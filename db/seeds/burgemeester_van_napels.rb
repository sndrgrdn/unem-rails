doc = Nokogiri::HTML(open('http://www.deburgemeestervannapels.nl/'))
menus = doc.css('.tab-pane')

c = City.find_or_create_by name: 'Leeuwarden'
r = Restaurant.create(name: 'Burgemeester van Napels', city: c)

menus.each do |menu|
  mt = MenuTypeSearch.find_type(menu['id'].downcase)
  m = Menu.create name: menu['id'].capitalize, restaurant: r, menu_type: mt

  menu.css('.dish').each do |dish|
    d = Dish.create(name: dish.css('.title').text.capitalize, price: dish.css('.price').text.slice(2..6).sub(',', '.'), menu: m)
    dish.css('.dish-description').text.split(',').each do |ingredient|
      Ingredient.create(name: ingredient.strip.capitalize, dish: d)
    end
  end
end
