class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  before_filter :authenticate_user!
  layout :determine_layout

  protect_from_forgery

   def determine_layout
    if !current_user.nil?
      "application"
    else
    	"session"
    end
   end

   def after_sign_out_path_for(resource_or_scope)
   		new_user_session_path
   end

   def after_sign_in_path_for(resource_or_scope)
    	dashboards_path
   end
end
