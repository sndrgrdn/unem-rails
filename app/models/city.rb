class City < ApplicationRecord
  extend FriendlyId

  has_many :restaurants

  friendly_id :name, use: :slugged

  validates :name, presence: true, uniqueness: { case_sensitive: false }

end
