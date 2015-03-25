class TeamsController < ApplicationController
  
  def create
    @team = Team.create!(team_params)
    redirect_to team_path(@team.id)
  end

  def update
    @team = Team.find(params[:id])
    @team.update_attributes!(team_params)
    redirect_to team_path(@team.id)
  end
  
  def index
    @teams = Team.recent_creation
  end

  def show
    @team = Team.includes(:repositories, :users).find(params[:id])
    @topics = Topic.where(user_id: @team.users.pluck(:id)).order('updated_at DESC').take(5)
    @statuses = Status.where(user_id: @team.users.pluck(:id)).order('updated_at DESC').take(5)
  end

  def add_user
    team = Team.find(params[:id])
    email = params[:team][:user_name].split.last
    user = User.find_by_email(email)
    team.users << user
    team.save!
    redirect_to team_path(team.id)
  end

  def delete
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to teams_path
  end

  private

    def team_params
      params.require(:team).permit(:name, :description)
    end
end