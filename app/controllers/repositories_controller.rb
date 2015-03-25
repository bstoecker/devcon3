class RepositoriesController < ApplicationController
  def new
    @repository = Repository.new
  end

  def create
    @repository = Repository.create(repository_params)
    redirect_to root_path
  end

  def destroy
    Repository.destroy(params[:id])
    redirect_to root_path
  end

  private

  def repository_params
    params.require(:repository).permit(:link)
  end
end
