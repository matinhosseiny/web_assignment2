class ScoresheetsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
  def create
    @scoresheet = current_user.scoresheets.build(scoresheet_params)
    if @scoresheet.save
      flash[:success] = "scoresheet created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end
  
  
  private

    def scoresheet_params
      params.require(:scoresheet).permit(:teamnumber,:correctness,:creativity,:relevence,:sustainability,:userexperience)
     
    end
end
