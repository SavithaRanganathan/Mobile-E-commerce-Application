class Processor < ActiveRecord::Base
		has_many :models

	def processor_specfications
		" #{name} |  #{company} | Speed : #{speed}(GHz) "
	end
end
