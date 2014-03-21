class OptionController < ApplicationController
	
	def new
	end
	def create
         @option =Option.new(user_params)
        logger.debug user_params
        
        if @category.save
             flash[:success] = "new option added"
             redirect_to  root_path 
         else
            render 'new'
       end
	end

end
