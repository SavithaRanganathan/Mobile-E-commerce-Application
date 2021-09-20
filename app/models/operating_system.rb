class OperatingSystem < ActiveRecord::Base
		has_many :models

	def os_specfications
		"#{name} |  #{version} | #{company}"
	end
end
