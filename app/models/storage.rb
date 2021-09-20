class Storage < ActiveRecord::Base
	has_many :models

	def storage_specfications
		"RAM: #{primary}GB | ROM: #{secondary}GB | Extended: #{extended}GB | Memorycard: #{memory_card}"
	end
end
