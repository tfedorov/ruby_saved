class DataProcessor
	def initialize(raw_elements)
		@raw_elements = raw_elements
	end
	
	def process_data
		clear_text_elements
		calculate_result
	end
	
	private
	def clear_text_elements
		@cleared_elements_text = @raw_elements.map{|raw_element| raw_element.gsub(/[^0-9,-]/,'')}
	end

	def calculate_result
		@cleared_elements_text.map{|sum| eval(sum) } .sort
	end	
end