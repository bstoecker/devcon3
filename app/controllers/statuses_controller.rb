class StatusesController < ApplicationController
  def index
    @status = Status.all
  end
  
  def show
    @status = Status.find(params[:id])
  end
  
  def new
    @status = Status.new
  end

  def edit
    @status = Status.find(params[:id])
  end
  
  def create
    @status = Status.new(status_params)

    respond_to do |format|
      if @status.save
        format.html { redirect_to @status, notice: 'Status was successfully created.' }
        format.json { render action: 'index', status: :created, location: @status }
      else
        format.html { render action: 'new' }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @status = Status.find(params[:id])
    
    respond_to do |format|
      if @status.update(status_params)
        format.html { redirect_to @status, notice: 'Status was successfully updated.' }
        format.json { render action: 'index', status: :updated, location: @status}
      else
        format.html { render action: 'edit' }
        format.json { render json: @status.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
    def status_params
      params.require(:status).permit(:content, :user_id)
    end
end
