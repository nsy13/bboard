class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  POSTS_NUMBER = 30

  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)
    @post.user = current_user
    if @post.save
      flash[:success] = "投稿しました"
      redirect_to topic_path(@topic)
    else
      @posts = @topic.posts.page(params[:page]).per(POSTS_NUMBER)
      render 'topics/show'
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
