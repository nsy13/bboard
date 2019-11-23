class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @threads
  end
end
