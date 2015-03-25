class ResponsesController < ApplicationController
  before_filter :authenticate_user!

  def create
    topic.responses.create(content: params[:response][:content], user: user)
    redirect_to topic_url(id: topic.id), status: 301
  end

  private

  def topic
    Topic.find params[:topic_id]
  end

  def user
    User.find params[:response][:user_id]
  end
end
