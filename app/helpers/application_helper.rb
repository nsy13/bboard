module ApplicationHelper
  def watching_topic?(topic)
    topic.watchlists.any? { |list| list.user_id == current_user.id }
  end

  def watching_topic_id(topic)
    topic.watchlists.select { |list| list.user_id == current_user.id }
  end

  def count_watching_user(topic)
    topic.watchlists.size
  end

  def dynamic_title(title)
    base_title = "bboard"
    if title.present?
      "#{ title } | #{ base_title }"
    else
      base_title
    end
  end
end
