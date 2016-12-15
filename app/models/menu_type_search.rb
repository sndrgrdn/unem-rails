class MenuTypeSearch < ApplicationRecord
  before_save :default_values

  belongs_to :menu_type

  def self.find_type(type)
    find_or_create_by(searchable: type.downcase).menu_type
  end

  private

  def default_values
    self.menu_type_id ||= 1
  end
end
