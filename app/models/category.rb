class Category < ApplicationRecord
  has_many :topics, through: :topic_categories
  validates :name, presence: true
end
