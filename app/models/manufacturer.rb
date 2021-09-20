class Manufacturer < ActiveRecord::Base
	has_many :models

  validates :name,  presence: true
  validates :parent_company, presence: true
end
