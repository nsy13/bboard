class Post < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  validates :content, presence: true, length: { maximum: 800 }
end
