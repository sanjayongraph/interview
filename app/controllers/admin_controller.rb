class AdminController < ApplicationController
  before_action :require_login
 

     def users_new
       @user = User.new 
     end
     
     def dashboard

     end

     def edit
       @user = User.find(params[:id])
       logger.debug @user
       logger.debug "in edit function"
     end

     def create
       @user = User.new(user_params) 
       logger.debug "lkkkkkkkkkkkkkkkkklkkkkkkkkk"
       logger.debug user_params   
       if @user.save
        flash[:success] = "New User Successfully Added!!!"
        redirect_to admin_dashboard_path
       else
        logger.debug "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq"
        render 'users_new'
       end
     end
   
     def update
       logger.debug "in Update function"
       @user = User.find(params[:id])
       if @user.update_attributes(user_params)
        flash[:success] = "Profile updated"
        #redirect_to root_path

       else
         render 'edit'
       end
     end
  
     def users
       @user=User.all
     end
  
     def destroy
       @user = User.find(params[:id])
       @user.destroy
       redirect_to admin_users_path
     end
     
     private

     def user_params
  	   params.require(:user).permit(:name, :role, :category, :email,:password,:password_confirmation)
     end
   
     def require_login
      unless signed_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to login_path # halts request cycle
      end
    end
end