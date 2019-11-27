class CategoriesController < ApplicationController
  before_action :admin_user, only: [:index, :new, :create, :edit, :update, :destroy]
  CATEGORY_NUMBER = 30

  def index
    store_location
    @categories = Category.order(:name).page(params[:page]).per(CATEGORY_NUMBER)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "カテゴリーを作成しました"
      redirect_back_or root_path
    else
      render 'new'
    end
  end

  def show
    store_location
    @categories = Category.order(:name).all
    @category = Category.find(params[:id])
    @topics = @category.topics.includes(:watchlists, posts: :user).order(:updated_at).page(params[:page]).per(TOPICS_NUMBER)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "カテゴリー名を変更しました"
      redirect_back_or root_path
    else
      render 'edit'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "カテゴリーを削除しました"
    redirect_back_or root_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
