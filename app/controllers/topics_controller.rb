class TopicsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_owner, only: [:edit, :update]

  def new
    @topic = Topic.new
    @categories = Category.all
  end

  def create
    @topic = current_user.topics.build(topic_params)
    post = @topic.posts.build(topic_post_params)
    post.user = current_user
    select_categories = params[:select_categories] || ""
    if @topic.save
      post.save
      if select_categories == "" && params[:category_search].present?
        category = Category.create(name: params[:category_search])
        TopicCategory.create(topic_id: @topic.id, category_id: category.id)
      elsif select_categories != ""
        select_categories.split(',').each do |c_id|
          TopicCategory.create(topic_id: @topic.id, category_id: c_id)
        end
      end
      flash[:success] = "スレッドを作成しました"
      redirect_to @topic
    else
      render 'new'
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @categories = @topic.categories
    @post = Post.new
    @posts = @topic.posts.page(params[:page]).per(POSTS_NUMBER)
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

  def topic_post_params
    params.require(:topic).permit(:content)
  end

  def correct_owner
    @topic = Topic.find(params[:id])
    unless @topic.user == current_user
      flash[:danger] = "権限がありません"
      redirect_to root_path
    end
  end
end
