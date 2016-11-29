class Dish < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  belongs_to :menu

  validates :name, presence: true
end
