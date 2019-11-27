class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  TOPICS_NUMBER = 30
  POSTS_NUMBER = 30

  def set_search
    @q = Topic.includes(:watchlists, posts: :user).ransack(params[:q])
    @topics = @q.result.includes(:watchlists, posts: :user).page(params[:page]).per(TOPICS_NUMBER)
  end

  private

  def admin_user
    unless current_user.admin?
      flash[:danger] = "権限がありません"
      redirect_back_or root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
end
