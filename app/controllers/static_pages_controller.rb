class StaticPagesController < ApplicationController
  def home
    
    if logged_in?
      @scoresheet  = current_user.scoresheets.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
end
