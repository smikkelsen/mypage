require 'open-uri'
class PagesController < ApplicationController
  protect_from_forgery

  before_filter :authenticate_admin_user!

  def index

    if params['search_string']
      search = "https://www.google.com/search?q=#{URI::encode(params['search_string'])}"
      search.gsub! '+', '%20'
      redirect_to search
    else

      if params[:page]
        @page = Page.find_by_id(params[:page])
      else
        @page = Page.find_by_default(true)
        if @page.nil?
          @page = Page.first
        end
      end
      @pages = Page.all

    end
  end

end
