class ApplicationController < ActionController::Base
  before_action :authenticate_user!  # ✅ Add this line

  def after_sign_in_path_for(resource)
    tasks_path  # Redirect to tasks page after successful login
  end
end
