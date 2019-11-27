class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @topics = Topic.order(:updated_at).page(params[:page]).per(TOPICS_NUMBER)
  end
end
