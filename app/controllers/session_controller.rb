class SessionController < ApplicationController
  #skip_before_action :check_login, only: [:destroy]
  before_action :check_login, only: [:new]
  before_action :check_logout, only: [:destroy]
  
	def new
	end

	def create
	  user = User.find_by(name: params[:session][:name].downcase)
	  if user.nil?
      render 'new'     
    else
      if user.role =="sadmin" && user.authenticate(params[:session][:password])|| user.role =="admin" && user.authenticate(params[:session][:password])
        logger.debug user.name
        logger.debug "user matched with the database"
        sign_in user
        redirect_to admin_dashboard_path

      elsif user.role =="user" && user.authenticate(params[:session][:password])
        logger.debug user.name
        logger.debug user.role
        logger.debug "You are a USER for this app"
        sign_in user
        redirect_to users_dashboard_path
            
      else
        logger.debug "it contains some errors"
        flash.now[:error] = 'Invalid email/password combination'
        #flash[:error] = 'Invalid email/password combination'
        render 'new'
      end
    end
  end

	def destroy
	 sign_out
   logger.debug "22222222"
   redirect_to root_path
	end

  private

    def check_login
      if signed_in?
        redirect_to admin_dashboard_path
      end
    end

    def check_logout
      if current_user == nil
        redirect_to login_path
      end
    end

end
