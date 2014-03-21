class UsersController < ApplicationController

	   def new
      @user=User.new
     end

    def create
    	@user = User.new(user_params)   
      if @user.save
    			flash[:success] = "User created"

      	  redirect_to users_dashboard_path
      else
      		render 'new'
    	end
    end

    def update
	    @user = User.find(params[:id])
	    if @user.update_attributes(user_params)
	       flash[:success] = "Profile updated"
	       redirect_to admin_users_path
	    else
	       render 'admin/edit'
	    end
	 end

    def user_params
       params.require(:user).permit(:name, :role, :category, :email,:password,:password_confirmation)
     end
   
end
