class ScoresheetsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy,:edit]
    before_action :correct_user,   only: :edit
  def create
    @scoresheet = current_user.scoresheets.build(scoresheet_params)
    if @scoresheet.save
      flash[:success] = "scoresheet created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
  end
  def edit
    @scoresheet = current_user.scoresheets.find(params[:id])
    
  end
  
  
  def update
    @scoresheet =current_user.scoresheets.find(params[:id])
    if @scoresheet.update_attributes(scoresheet_params)
      flash[:success] = "Profile updated"
      redirect_to current_user
    else
      render 'edit'
    end
  end
  
  
  private

    def scoresheet_params
      params.require(:scoresheet).permit(:teamnumber,:correctness,:creativity,:relevence,:sustainability,:userexperience)
     
    end
    def correct_user
      @scoresheet = current_user.scoresheets.find_by(id: params[:id])
      redirect_to root_url if @scoresheet.nil?
    end
end
