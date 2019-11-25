class Topic < ApplicationRecord
  belongs_to :user
  has_many :posts
  validates :name, presence: true, length: { maximum: 300 }
end
