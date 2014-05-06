class Admin::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout 'admin'
  include SessionsHelper
  include ApplicationHelper

  before_action :login_required, :admin_required
  
  class AccessDenied < Exception; end

  def login_required
    raise AccessDenied unless login?
  end

  def admin_required
    raise AccessDenied unless !current_user.nil? && current_user.admin?
  end
end
