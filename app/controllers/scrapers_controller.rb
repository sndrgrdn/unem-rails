class ScrapersController < ApplicationController

  def scrape
    render text: 'success'
  end

  private

  def thuisbezorgd

  end

  def burgemeester_van_napels
    doc = Nokogiri::HTML(open('http://www.deburgemeestervannapels.nl/'))
    menus = doc.css('.tab-pane')

    # @menuArray = []
    #
    # menus.each do |menu|
    #   id = menu['id']
    #
    #   menu.css('.dish').each do |dish|
    #     title = dish.css('.title').text
    #     price = dish.css('.price').text.slice(2..6).sub(',', '.')
    #     ingredients = dish.css('.dish-description').text.split(',')
    #   end
    # end

    r = Restaurant.find(2)

    menus.each do |menu|
      m = Menu.create(name: menu['id'].capitalize, restaurant: r)

      menu.css('.dish').each do |dish|
        d = Dish.create(name: dish.css('.title').text, price: dish.css('.price').text.slice(2..6).sub(',', '.'), menu: m)
        dish.css('.dish-description').text.split(',').each do |ingredient|
          Ingredient.create(name: ingredient, dish: d)
        end
      end
    end
    render text: 'success'
  end
end
