class Restaurant < ApplicationRecord
  extend FriendlyId
  dragonfly_accessor :image do
    default 'app/assets/images/uurwerker.png'
  end

  has_many :menus, dependent: :destroy
  belongs_to :city

  friendly_id :name, use: :scoped, scope: :city

  validates :name, presence: true, uniqueness: { scope: :city_id, case_sensitive: false }
end
