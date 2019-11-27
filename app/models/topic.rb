class Topic < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :topic_categories
  has_many :categories, through: :topic_categories
  has_many :watchlists
  has_many :users, through: :watchlists
  validates :name, presence: true, length: { maximum: 300 }
end
