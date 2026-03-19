class Restaurant < ApplicationRecord
  has_many :menu_items

  validates :name, :address, presence: true
end
