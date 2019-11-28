class WatchlistsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show, :destroy]

  def index
    store_location
    watching_topics = Watchlist.where(user_id: current_user).map { |list| Topic.find(list.topic_id) }
    @watching_topics = Kaminari.paginate_array(watching_topics).page(params[:page]).per(TOPICS_NUMBER)
    @categories = Category.order(:name).all
  end

  def create
    topic = Topic.find(params[:id])
    Watchlist.create(user_id: current_user.id, topic_id: topic.id)
    flash[:success] = "ウォッチリストに登録しました"
    redirect_back_or root_path
  end

  def destroy
    Watchlist.find(params[:id]).destroy
    flash[:success] = "ウォッチリストから削除しました"
    redirect_back_or root_path
  end
end
