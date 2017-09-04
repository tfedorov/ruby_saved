class BannerSiteController < ApplicationController
  after_action :add_header_after
  before_action :check_host
  before_action :check_host_for_banner , only: [:next_banner, :add_click]

  def init_banner_site
    render json: Site.first_banner_for_host(@host)
  end

  def next_banner
    render json: @banner_site.proccess_and_next
  end

  def add_click
    @banner_site
    @banner_site.click_number += 1
    @banner_site.save!
    render json: { 'result' => 'succes ' }
  end

  private

  def check_host
    @host = request.headers[:origin]
    fail 'Origin param should be set' if @host.nil?
  end

  def check_host_for_banner
    @banner_site = BannerSite.find(params.require(:banner_site_id))
    fail'Not your site' if @banner_site.site.host != @host
  end

  def add_header_after
    headers['Access-Control-Allow-Origin'] = '*'
  end
end
