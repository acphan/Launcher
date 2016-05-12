class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index,:show]
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.search(params[:search])
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project        = Project.find(params[:id])
    @new_comment    = Comment.build_from(@project, current_user.id, "")
  end

  # GET /projects/new
  def new
    @project = current_user.projects.build
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.build(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
        #group = Group.new
        #@project.groups << group
        #current_user.groups << group
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
      @project.group = nil
    end
  end


  def upvote
    @project = Project.find(params[:id])
    @project.upvote_by current_user
    redirect_to :back
  end
  
  def downvote
    @project = Project.find(params[:id])
    @project.downvote_by current_user
    redirect_to :back
  end

  def join_group
    @project.group.add(current_user)
    redirect_to :back
  end
    
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      #params.require(:project).permit(:title, :url, :description)
      #Used with ActAsTaggableOn
      params.require(:project).permit(:title, :url, :description, :tag_list)
    end
end
