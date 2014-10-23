class SiteController < ApplicationController
  def index
	@title= " Welcome to planner!"
  end

  def about
	@title ="About planner"
  end

  def help
	@title= "Help"
  end
end
