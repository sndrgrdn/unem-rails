json.array! @dishes do |dish|
  json.name dish.name
  json.price dish.price
  json.ingredients dish.ingredients do |ingredient|
    json.name ingredient.name
  end
end
