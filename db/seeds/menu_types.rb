menu_types = ["pizza", "pasta", "starters", "salads", "kids", "meat", "fish", "chicken", "lasagne", "side", "pho", "ramen", "cold-drinks", "warm-drinks", "alcohol", "distilled", "wine", "game", "ribs", "burgers", "fries", "mixed", "vega", "soup", "snacks", "dessert", "calzone", "drinks", "bun", "sauce", "cocktails"]

MenuType.find_or_create_by name: 'default'
menu_types.each do |menu_type|
  MenuType.find_or_create_by(name: menu_type)
end

menu_type_searchables = [
  { searchable: "antipasti", menu_type_id: 4 },
  { searchable: "pasta", menu_type_id: 3 },
  { searchable: "pizze", menu_type_id: 2 },
  { searchable: "pizza", menu_type_id: 2 },
  { searchable: "dolci", menu_type_id: 27 },
  { searchable: "bambini", menu_type_id: 6 },
  { searchable: "tasty snacks", menu_type_id: 26 },
  { searchable: "soepen", menu_type_id: 25 },
  { searchable: "overige pasta", menu_type_id: 3 },
  { searchable: "deeggerechten pasta", menu_type_id: 3 },
  { searchable: "hoofdgerechten vlees", menu_type_id: 7 },
  { searchable: "visgerechten", menu_type_id: 8 },
  { searchable: "insalate", menu_type_id: 5 },
  { searchable: "voorgerechten", menu_type_id: 4 },
  { searchable: "nagerechten", menu_type_id: 27 },
  { searchable: "schotels", menu_type_id: 1 },
  { searchable: "mixed grill", menu_type_id: 23 },
  { searchable: "spareribs", menu_type_id: 20 },
  { searchable: "kip gerechten", menu_type_id: 9 },
  { searchable: "pizza's", menu_type_id: 2 },
  { searchable: "pizza's vegetarisch", menu_type_id: 2 },
  { searchable: "calzones", menu_type_id: 28 },
  { searchable: "calzone's", menu_type_id: 28 },
  { searchable: "calzone", menu_type_id: 28 },
  { searchable: "kindermenu", menu_type_id: 6 },
  { searchable: "extra's", menu_type_id: 1 },
  { searchable: "dranken", menu_type_id: 29 },
  { searchable: "pastagerechten", menu_type_id: 3 },
  { searchable: "lasagne", menu_type_id: 10 },
  { searchable: "cannelloni of ravioli", menu_type_id: 3 },
  { searchable: "bijgerechten", menu_type_id: 11 },
  { searchable: "ramen", menu_type_id: 13 },
  { searchable: "pho", menu_type_id: 12 },
  { searchable: "bun", menu_type_id: 30 },
  { searchable: "cold drinks", menu_type_id: 14 },
  { searchable: "warm drinks", menu_type_id: 15 },
  { searchable: "alcohol", menu_type_id: 16 },
  { searchable: "shoarma en döner gerechten", menu_type_id: 23 },
  { searchable: "lahmacun gerechten", menu_type_id: 23 },
  { searchable: "oriëntaalse gerechten", menu_type_id: 23 },
  { searchable: "turkse broodjes", menu_type_id: 30 },
  { searchable: "peckish? don't go hungry! share some of our tasty snacks", menu_type_id: 26 },
  { searchable: "populaire gerechten", menu_type_id: 1 },
  { searchable: "broodjes döner kebab", menu_type_id: 30 },
  { searchable: "schotels döner kebab", menu_type_id: 1 },
  { searchable: "turkse pizza", menu_type_id: 2 },
  { searchable: "100% kipfilet hasret chicken nuggets", menu_type_id: 9 },
  { searchable: "diversen", menu_type_id: 1 },
  { searchable: "sauzen", menu_type_id: 31 },
  { searchable: "salades", menu_type_id: 5 },
  { searchable: "dranken 33 cl", menu_type_id: 29 },
  { searchable: "dranken 0,5 l", menu_type_id: 29 },
  { searchable: "alcoholische dranken", menu_type_id: 16 },
  { searchable: "desserts", menu_type_id: 27 },
  { searchable: "dessert", menu_type_id: 27 },
  { searchable: "frisdranken", menu_type_id: 29 }
]

menu_type_searchables.each do |mts|
  MenuTypeSearch.find_or_create_by mts
end
