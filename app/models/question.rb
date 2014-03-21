class Question < ActiveRecord::Base
	
 has_many :options, dependent: :destroy

 validates :question, presence: true

 validates :answer1, presence: true 

end
