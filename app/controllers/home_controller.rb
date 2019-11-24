class HomeController < ApplicationController
  TOPICS_NUMBER = 30

  def index
    @topics = Topic.order(:updated_at).page(params[:page]).per(TOPICS_NUMBER)
  end
end
