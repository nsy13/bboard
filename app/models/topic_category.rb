class TopicCategory < ApplicationRecord
  belongs_to :category
  belongs_to :topic
  validates :topic_id, uniqueness: { scope: :category_id }
end
