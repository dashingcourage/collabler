# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search_query

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name username website self_intro phone_number sex])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name username website self_intro phone_number sex])
  end

  def after_sign_in_path_for(resource)
    '/posts'
  end

  def set_search_query
    @search = Post.ransack(params[:q])
    @search_posts = @search.result.page(params[:page])
  end

end
