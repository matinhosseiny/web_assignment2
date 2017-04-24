class StaticPagesController < ApplicationController
  def home
    @scoresheet = current_user.scoresheets.build if logged_in?
  end
end
