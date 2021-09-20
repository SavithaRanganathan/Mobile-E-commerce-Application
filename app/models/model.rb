class Model < ActiveRecord::Base
	has_one :manufactures
	has_one :operating_systems
	has_one :processors
	has_one :storages
	has_many :cameras , :dependent => :delete_all 
	accepts_nested_attributes_for :manufactures
	accepts_nested_attributes_for :storages
	accepts_nested_attributes_for :operating_systems
	accepts_nested_attributes_for :processors
	accepts_nested_attributes_for :cameras


         
   validates :name,  presence: true
   validates :description,  presence: true
   validates :selling_price,  presence: true
   validates :year_of_release,  presence: true
   validates :usb_type,  presence: true
   validates :battery_capacity,  presence: true
   validates :height,  presence: true
   validates :width,  presence: true
   validates :sim_type,  presence: true
   validates :colour,  presence: true
   validates :network_supported,  presence: true


end
