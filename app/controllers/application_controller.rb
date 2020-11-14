class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    case resource
    when Administrator
      administrator_top_path
    when Customer
      root_path
    end
  end

end
