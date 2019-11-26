class Topic < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :categories, through: :topic_categories
  validates :name, presence: true, length: { maximum: 300 }
end
