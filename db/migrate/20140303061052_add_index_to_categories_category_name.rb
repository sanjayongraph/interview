class AddIndexToCategoriesCategoryName < ActiveRecord::Migration
  def change
  	 add_index :categories, :category_name, unique: true
  end
end
