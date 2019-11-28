class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @topics = Topic.includes(:watchlists, posts: :user).where(user_id: @user.id).order(updated_at: :DESC).
      page(params[:page]).per(TOPICS_NUMBER)
  end
end
