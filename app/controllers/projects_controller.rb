class ProjectsController < ApplicationController
  def index
    @selected_state = 'All'
    if params[:state].present? && params[:state] != 'All'
      @selected_state = params[:state]
      @projects = Project.where('state = ?', params[:state])
    else  
      @projects = Project.all
    end
  end

  def new
    @project = Project.new
  end

  def create
    # Project.create(
    #   name: params[:name],
    #   description: params[:description],
    #   start_date: params[:start_date],
    #   end_date: params[:end_date]
    # )

    post = Project.new(project_params)
    post.save

    redirect_to root_path
  end

  def project_params
    params.require(:project).permit(:name, :description, :start_date, :end_date, :state)
  end
end
