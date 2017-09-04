class ParserController < ApplicationController
  def new
  end

  def result
    product_id = params.require(:id)
    comment_text = params.require(:text)
    @comments = ParseProcessor.new.parse_comments(product_id, comment_text)

  end
end
