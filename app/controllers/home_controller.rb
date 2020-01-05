class HomeController < ApplicationController
  def index
    store_location
    @topics = Topic.includes(:watchlists, posts: :user).order(updated_at: :DESC).page(params[:page]).per(TOPICS_NUMBER)
    @categories = Category.order(:name).all
    render json: @categories
  end
end
