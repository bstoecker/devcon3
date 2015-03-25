class TopicsController < ApplicationController
  before_filter :authenticate_user!

  def index
    if params[:search]
      search(params[:search])
    else
      @topics = Topic.all.paginate(:page => params[:topics], :per_page => 10)
    end
  end

  def show
    @topic = Topic.includes(:responses).find(params[:id])
    @responses = @topic.responses
  end

  def new
    @topic = Topic.new
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def create

    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'Topic was successfully created.' }
        format.json { render action: 'index', topic: :created, location: @topic }
      else
        format.html { render action: 'new' }
        format.json { render json: @topic.errors, topic: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'Topic was successfully updated.' }
        format.json { render action: 'index', topic: :updated, location: @topic}
      else
        format.html { render action: 'edit' }
        format.json { render json: @topic.errors, topic: :unprocessable_entity }
      end
    end
  end
  
  def search(s)
    @topics = Topic.where('title LIKE ?', "%#{s}%")
  end

  private
    def topic_params
      params.require(:topic).permit(:title, :content, :type, :user_id, :post_type)
    end
end
