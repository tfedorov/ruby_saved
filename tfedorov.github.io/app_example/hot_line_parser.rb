require 'java'
require 'nokogiri'  
require 'open-uri'
#java
require  './jetm-1.2.3.jar'
java_import 'etm.core.monitor.EtmMonitor'
java_import 'etm.core.configuration.EtmManager'
class HotLineParser

CSS_ELEMENTS = 'div.price span.orng i.blck'
URL_PREFIX = 'http://hotline.ua/sr/?q='

	def initialize(elenet_to_search)
		@url = URL_PREFIX + elenet_to_search
		@monitor = EtmManager::getEtmMonitor
	end
	
	def parse_result
		point_load = @monitor.createPoint('HotLineParser::load_page')
		load_page
		point_load.collect
		
		point_read= @monitor.createPoint('HotLineParser::read_data')
		result = read_result_text
		point_read.collect
		result
	end
	
	private
	def load_page
		@page = Nokogiri::HTML(open(@url))   
	end
	
	def read_result_text
		@page.css(CSS_ELEMENTS).map(&:text)
	end
end