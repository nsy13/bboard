class WatchlistsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show, :update, :destroy]

  def create
    topic = Topic.find(params[:id])
    Watchlist.create(user_id: current_user.id, topic_id: topic.id)
    flash[:success] = "ウォッチリストに登録しました"
    redirect_to root_path
  end

  def show

  end

  def update

  end

  def destroy

  end
end
