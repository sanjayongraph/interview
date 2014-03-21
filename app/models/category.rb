class Category < ActiveRecord::Base

	has_many :questions
	
	before_save { self.category_name = category_name.downcase }
	validates :category_name, presence: true, 
                    uniqueness: { case_sensitive: false }
end
