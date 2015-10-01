class PagesController < ApplicationController
  def home
    @page_title ='Home'
  end

  def help
    # title to be set via provide method in the View
  end
end
