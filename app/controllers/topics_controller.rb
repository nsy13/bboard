class TopicsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_owner, only: [:edit, :update]

  def index
    store_location
    @topics = @q.result.includes(:watchlists, posts: :user).page(params[:page]).per(TOPICS_NUMBER)
    @categories = Category.order(:name).all
  end

  def new
    @topic = Topic.new
    @categories = Category.order(:name).all
    @tagged_categories = []
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
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
    store_location
    @topic = Topic.find(params[:id])
    @categories = @topic.categories
    @post = Post.new
    @posts = @topic.posts.includes(:user).page(params[:page]).per(POSTS_NUMBER)
  end

  def edit
    @topic = Topic.find(params[:id])
    @categories = Category.order(:name).all
    @tagged_categories = @topic.categories
  end

  def update
    @topic = Topic.find(params[:id])
    @topic_association = @topic.topic_categories
    select_categories = params[:select_categories] || ""
    if @topic.update_attributes(topic_params)
      @topic_association.destroy_all
      if select_categories == "" && params[:category_search].present?
        category = Category.create(name: params[:category_search])
        TopicCategory.create(topic_id: @topic.id, category_id: category.id)
      elsif select_categories != ""
        select_categories.split(',').each do |c_id|
          TopicCategory.create(topic_id: @topic.id, category_id: c_id)
        end
      end
      flash[:success] = "スレッド名をとカテゴリーを変更しました"
      redirect_to @topic
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def topic_params
    params.require(:topic).permit(:name, :user_id)
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
