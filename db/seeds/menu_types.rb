menu_types = menu_types + ["pizza", "pasta", "starters", "salads", "kids", "meat", "fish", "chicken", "lasagne", "side", "pho", "ramen", "cold-drinks", "warm-drinks", "alcohol", "distilled", "wine", "game", "ribs", "burgers", "fries", "mixed", "vega", "soup", "snacks", "dessert", "calzone", "drinks", "bun", "sauce", "cocktails"]

MenuType.find_or_create_by name: 'default'
menu_types.each do |menu_type|
  MenuType.find_or_create_by(name: menu_type)
end
