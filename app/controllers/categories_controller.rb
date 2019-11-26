class CategoriesController < ApplicationController
  before_action :authentication_user!, only: [:create, :edit, :update, :destory]

  def show

  end
end
