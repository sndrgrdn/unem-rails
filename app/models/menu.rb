class Menu < ApplicationRecord
  extend FriendlyId

  before_save :default_values

  has_many :dishes, dependent: :destroy
  belongs_to :restaurant
  belongs_to :menu_type

  friendly_id :name, use: :scoped, scope: :restaurant

  validates :name, presence: true, uniqueness: { scope: :restaurant_id, case_sensitive: false }

  private

  def default_values
    self.menu_type_id ||= 1
  end
end
