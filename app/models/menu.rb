class Menu < ApplicationRecord
  extend FriendlyId

  has_many :dishes, dependent: :destroy
  belongs_to :restaurant

  friendly_id :name, use: :scoped, scope: :restaurant

  validates :name, presence: true, uniqueness: { scope: :restaurant_id, case_sensitive: false }
end
