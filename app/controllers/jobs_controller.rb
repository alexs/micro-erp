class JobsController < ApplicationController
  load_and_authorize_resource
  before_filter :load_by_pagination, :only => :index
  helper_method :sort_column, :sort_direction

  def index
   # @jobs = job.order(sort_column + ' ' + sort_direction).paginate(:per_page => 20, :page => params[:page])
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @job = Job.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @job = Job.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(params[:job])
    @job.user_id = current_user.id

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'job was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @job = Job.find(params[:id])
    @job.user_id = current_user.id

    respond_to do |format|
      if @job.update_attributes(params[:job])
        format.html { redirect_to @job, notice: 'job was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    respond_to do |format|
      format.html { redirect_to jobs_url }
    end
  end

  def load_by_pagination
    if !params[:search].nil? && params[:search].size > 0
      search = "#{params[:search]}"
      @jobs = Job.accessible_by(current_ability).where("id = ? ", search).order(params[:sort]).paginate(:per_page => 10, :page => params[:page]).order(params[:sort])
    else
      @jobs = Job.accessible_by(current_ability).order(params[:sort]).paginate(:per_page => 10, :page => params[:page])      
    end
  end

  private
  def sort_column
   Job.column_names.include?(params[:sort]) ? params[:sort] : "id"
 end
 
 def sort_direction
   %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
 end    
end
