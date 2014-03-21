class CategoryController < ApplicationController

  before_action :require_login

  def new
    @category=Category.new
  end
 
  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(user_params)
        logger.debug user_params
        if @category.parent==""  ||  @category.parent=="root" 
           @category.parent="root"
             
        else
        end
        
        if @category.save
             flash[:success] = "new Category added"
             redirect_to  admin_categories_path 
         else
            render 'new'
       end
  end
  
  def show
       @category=Category.all
  end

  def destroy
       @category = Category.find(params[:id])
       @sub = Category.where(:parent =>@category.category_name)
       @category.destroy
       @sub.each do |u| 
       u.destroy
       end
       redirect_to category_path() 
  end
  
  def update
       @category = Category.find(params[:id])
       @sub = Category.where(:parent =>@category.category_name)
       @sub.each do |u|
        
       u.parent=params["category"]["category_name"]
       u.save
       end
       if @category.update_attributes(user_params)
           if @category.parent=="" ||  @category.parent=="root"
                @category.parent="root"
                @category.save
           else
           end
           redirect_to category_path

       else
         #render 'edit'
       end
 end

  private

      def user_params
          params.require(:category).permit(:parent, :category_name)
          end


      def require_login
        unless signed_in?
          flash[:error] = "You must be logged in to access this section"
          redirect_to login_path # halts request cycle
        end
      end
    
end
