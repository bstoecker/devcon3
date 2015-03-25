class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def overview
    @topics = Topic.includes(:user).paginate(page: params[:topics_page], per_page: 9)
    @statuses = Status.includes(:user).paginate(page: params[:statuses_page], per_page: 6)
  end
end
