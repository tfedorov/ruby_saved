require 'JSON'

class FileSaver

	def initialize(url, data)
		@url = url
		@data = data
	end

	def save_to_file
		File.open("saved.json", 'a') { |file| file.write(generate_json) }
	end

	private
	def generate_json
		JSON.pretty_generate(@url => @data)
	end
end