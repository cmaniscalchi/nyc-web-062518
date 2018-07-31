class SessionsController < ApplicationController
  # authorized is coming from ApplicationController
  # skip if the user wants to sign in
  # users should not have to be authorized (logged in) in order to login; create a new session
  skip_before_action :authorized, only: [:new, :create]

  def new # renders form to create a new session
    # new session means user is LOGGED IN
    #code
    render :new
  end

  def create # creates a new session; POST to /sessions
    # authenticate my user–> is their username valid? is their password valid?
      # ask the model (User) for the user with the username in params that are coming from my form
    @user = User.find_by({ username: params[:username] })

    if !!@user && @user.authenticate(params[:password])
      # the user is who they say they are AUTHENTICATION SUCCEEDED!!!
      session[:logged_in_user_id] = @user.id
      flash[:notice] = "Login Successful!"
      redirect_to profile_path
    else
      # flash[:notice] = "HACKER DETECTED! ALERTING POLICE"
      flash[:notice] = "Invalid username or password"
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete(:logged_in_user_id)
    flash[:notice] = "Logout successful"
    redirect_to new_session_path
  end
end
