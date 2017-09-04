require 'open-uri'
require 'nokogiri'
class ParseProcessor
  def parse_comments(product_id, text = '')
    page = parse_html_page(product_id)
    get_matched_comments(page, text)
  end

  private

  def parse_html_page(product_id)
    source = "http://www.walmart.com/ip/#{product_id}#reviews"

    site = open(source)

    Nokogiri::HTML(site)
  end

  def get_matched_comments(page, text)
    matched_comments = []
    page.css('p.js-customer-review-text').each do |content|
      matched_comments << content.text if text_matches?(content.text, text)
    end
    matched_comments
  end
# json parser
   def text_matches?(raw_comment_text, raw_searched_text)
     return false if raw_comment_text.nil? || raw_searched_text.nil?
     comment_text = raw_comment_text.upcase
     searched_tex = raw_searched_text.upcase
     comment_text.include? searched_tex
   end

#   def parse_json_page(product_id)
#     pages = check_pages_number(product_id)
#     comments = []
#     pages.each { |page| check_json_page(page) }
#     comment
#   end

#   def check_pages(product_id)
#     source = "http://www.walmart.com/reviews/api/questions/#{product_id}"
 #    []
  # end

#   def check_json_page(page)
 #  end
end

