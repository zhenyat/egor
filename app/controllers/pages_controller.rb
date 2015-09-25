class PagesController < ApplicationController
  def home
    @page_title = :home_page
  end

  def help
    @page_title = :help_page
  end
end
