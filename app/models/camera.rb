class Camera < ActiveRecord::Base
	belongs_to :models 
	self.inheritance_column = nil
end
