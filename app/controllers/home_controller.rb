class HomeController < ApplicationController
  def index
    @topics = Topic.order(:updated_at).page(params[:page]).per(TOPICS_NUMBER)
    @categories = Category.all
  end
end
