class ScoresheetsController < ApplicationController
    before_action :logged_in_user, only: [:index, :create, :destroy,:edit, :show]
    before_action :correct_user,   only: [:index, :edit, :show]
   
  
  def index
    @scoresheet =Scoresheet.new
  end
  def create
    @users = User.all
    @users.each do |user|
      @scoresheet = user.scoresheets.build(team_params)
      if @scoresheet.save
        flash[:success] = "scoresheet created!"
        
      else
        
      end
    end
    redirect_to root_url
  end


  def show
     render 'static_pages/test'
  end

  def destroy
  end
  def edit
    
    if current_user.admin?
        @scoresheet =Scoresheet.find_by(id: params[:id])
      else
    @scoresheet = current_user.scoresheets.find(params[:id])
  end
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

    def team_params
     
      params.require(:scoresheet).permit(:teamnumber)
    
    end
    def scoresheet_params
     
      params.require(:scoresheet).permit(:teamnumber,:correctness,:creativity,:relevence,:sustainability,:userexperience)
    
    end
    def correct_user
      if current_user.admin?
        @scoresheet =Scoresheet.find_by(id: params[:id])
      else
      
      @scoresheet = current_user.scoresheets.find_by(id: params[:id])
      
      redirect_to root_url if @scoresheet.nil?
      end
    end
end
