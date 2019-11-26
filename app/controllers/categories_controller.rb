class CategoriesController < ApplicationController
  before_action :authentication_user!, only: [:create, :edit, :update, :destory]

  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @topics = @category.topics.order(:updated_at).page(params[:page]).per(TOPICS_NUMBER)
  end
end
