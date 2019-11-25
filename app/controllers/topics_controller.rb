class TopicsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_owner, only: [:edit, :update]

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      flash[:success] = "スレッドを作成しました"
      redirect_to @topic
    else
      render 'new'
    end
  end

  def show
    @topic = Topic.find(params[:id])
    # @posts = @topic.posts
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update_attributes(topic_params)
      flash[:success] = "スレッド名を変更しました"
      redirect_to @topic
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def topic_params
    params.require(:topic).permit(:name)
  end

  def correct_owner
    @topic = Topic.find(params[:id])
    unless @topic.user == current_user
      flash[:danger] = "権限がありません"
      redirect_to root_path
    end
  end
end
