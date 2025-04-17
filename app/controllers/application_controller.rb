class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    tasks_path  # Redirect to tasks page after successful login
  end
end
