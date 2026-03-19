class MenuItem < ApplicationRecord
  belongs_to :restaurant

  validates :name, :price, presence: true

  scope :by_name, ->(name) {
    where("name LIKE ?", "%#{name}%") if name.present?
  }

  scope :by_category, ->(category) {
    where(category: category) if category.present?
  }
end
