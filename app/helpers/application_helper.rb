module ApplicationHelper
  def watching_topic?(topic)
    Watchlist.find_by(user_id: current_user.id, topic_id: topic.id).present?
  end

  def watching_topic_id(topic)
    Watchlist.find_by(user_id: current_user.id, topic_id: topic.id).id
  end
end
