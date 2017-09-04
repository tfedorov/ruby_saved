require 'java'
require 'rubygems'

load 'hot_line_parser.rb'
load 'file_saver.rb'
load 'data_processor.rb'
# added java
require  './jetm-1.2.3.jar'
require  './jetm-optional-1.2.3.jar'
java_import 'etm.core.monitor.EtmMonitor'
java_import 'etm.core.configuration.EtmManager'
java_import 'etm.core.renderer.SimpleTextRenderer'
java_import 'etm.core.configuration.BasicEtmConfigurator'
java_import 'etm.contrib.console.HttpConsoleServer'


def process_page(search_element)
	point_all = @monitor.createPoint('Monitor_etm::process_page::' + search_element)
	
	point_hotline = @monitor.createPoint('Monitor_etm::HotLineParser')
	@raw_result = HotLineParser.new(search_element).parse_result
	point_hotline.collect
	
	point_data = @monitor.createPoint('Monitor_etm::DataProcessor')
	@clear_data = DataProcessor.new(@raw_result).process_data 
	point_data.collect
	
	point_file = @monitor.createPoint('Monitor_etm::FileSaver')
	FileSaver.new(search_element, @clear_data).save_to_file
	point_file.collect
	
	point_all.collect
end


def configure_monitor
	BasicEtmConfigurator::configure(true)
	@monitor = EtmManager::getEtmMonitor
	@monitor.start
	@server = HttpConsoleServer.new(@monitor)
	@server.setListenPort(45000)
	@server.start
end

configure_monitor
loop do 
	puts 'Write product for search of empty line to exit'
	out_console = gets
	process_page(out_console)
end 