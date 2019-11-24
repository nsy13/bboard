class TopicsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
  end

  def new
    @topic = Topic.new
  end

  def create
    byebug
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      flash[:success] = "スレッドを作成しました"
      redirect_to @topic
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def topic_params
    params.require(:topic).permit(:name)
  end
end
