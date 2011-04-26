module SessionsHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def authenticate
    deny_access unless signed_in?
  end
  
  def store_location
    session[:return_to] = request.request_uri
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  ## Listing 10.16
  def clear_return_to
    session[:return_to] = nil
  end
  
  def deny_access
    flash[:notice] = "Please sign in to access this page."
    redirect_to root_url
  end
end
