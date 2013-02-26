class PagesController < ApplicationController
    protect_from_forgery

    before_filter :authenticate_admin_user!

  def index
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
