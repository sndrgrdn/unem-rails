def thuisbezorgd(city: '', url: '', website: '', facebook: '')
  doc = Nokogiri::HTML(open(url))
  menus = doc.css('.menucardcategorycontainer')
  r_name = doc.css('.restaurantinfoname').text

  c = City.find_or_create_by(name: city)
  r = Restaurant.create name: r_name, website: website, facebook: facebook, city: c

  menus.each do |menu|
    menu_name = menu.css('span.menucategorytitle').text
    mt = MenuTypeSearch.find_type(menu_name.strip)
    m = Menu.create(name: menu_name.strip.capitalize, restaurant: r, menu_type: mt)

    menu.next_element.css('.menucardproduct').each do |dish|
      title = dish.css('.menucardproductname > text()').text
      price = dish.css('.price').text.slice(1,6).sub(',','.')
      d = Dish.create(name: title.strip.capitalize, price: price, menu: m)

      ingredients = dish.css('.menucardproductdescription').text.split(',')
      ingredients = ingredients + ingredients.pop.split(' en ') if ingredients.size > 1

      ingredients.each do |ingredient|
        Ingredient.create(name: ingredient.strip.capitalize, dish: d)
      end
    end
  end

  r.menus.first.destroy
end

thuisbezorgd \
  url: 'https://www.thuisbezorgd.nl/pizzeria-rimini-2',
  city: 'Groningen',
  website: 'http://www.pizzeria-rimini.nl/',
  facebook: 'https://www.facebook.com/pages/Pizzeria-Rimini-Groningen/562632167105866?rf=478833995557752'

thuisbezorgd \
  url: 'https://www.thuisbezorgd.nl/ali-baba-winschoten',
  city: 'Winschoten',
  website: 'http://www.alibabawinschoten.nl/',
  facebook: 'https://www.facebook.com/pages/Ali-Baba/1500101520259508'

thuisbezorgd \
  url: 'https://www.thuisbezorgd.nl/o-sole-mio-winschoten',
  city: 'Winschoten',
  website: 'http://www.pizzeriaosolemio.nl/',
  facebook: 'https://www.facebook.com/Pizzeria-ristorante-O-Sole-Mio-276621545819443/'

thuisbezorgd \
  url: 'https://www.thuisbezorgd.nl/hasret-1',
  city: 'Groningen',
  website: 'http://www.hasret-groningen.nl/',
  facebook: 'https://nl-nl.facebook.com/HasretPoelestraat'

thuisbezorgd \
  url: 'https://www.thuisbezorgd.nl/trattoria',
  city: 'Groningen',
  website: 'http://www.pizzeria-trattoria.nl/',
  facebook: 'https://www.facebook.com/pages/PizzeriaRistorante-La-Trattoria/356012631126058'
