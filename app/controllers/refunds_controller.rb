class RefundsController < ApplicationController
  load_and_authorize_resource
  before_filter :load_by_pagination, :only => :index
  helper_method :sort_column, :sort_direction
  # GET /refunds
  # GET /refunds.json
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @refunds }
    end
  end

  # GET /refunds/1
  # GET /refunds/1.json
  def show
    @refund = Refund.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @refund }
    end
  end

  # GET /refunds/new
  # GET /refunds/new.json
  def new
    @refund = Refund.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @refund }
    end
  end

  # GET /refunds/1/edit
  def edit
    @refund = Refund.find(params[:id])
  end

  # POST /refunds
  # POST /refunds.json
  def create
    @refund = Refund.new(params[:refund])

    respond_to do |format|
      if @refund.save
        format.html { redirect_to @refund, notice: 'Refund was successfully created.' }
        format.json { render json: @refund, status: :created, location: @refund }
      else
        format.html { render action: "new" }
        format.json { render json: @refund.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /refunds/1
  # PUT /refunds/1.json
  def update
    @refund = Refund.find(params[:id])

    respond_to do |format|
      if @refund.update_attributes(params[:refund])
        format.html { redirect_to @refund, notice: 'Refund was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @refund.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /refunds/1
  # DELETE /refunds/1.json
  def destroy
    @refund = Refund.find(params[:id])
    @refund.destroy

    respond_to do |format|
      format.html { redirect_to refunds_url }
      format.json { head :no_content }
    end
  end

  def load_by_pagination
    if !params[:search].nil? && params[:search].size > 0
      search = "#{params[:search]}"
      @refunds = Refund.accessible_by(current_ability).where("id = ? ", search).order(params[:sort]).paginate(:per_page => 10, :page => params[:page]).order(params[:sort])
    else
      @refunds = Refund.accessible_by(current_ability).order(params[:sort]).paginate(:per_page => 10, :page => params[:page])      
    end
  end

  private
  def sort_column
   Refund.column_names.include?(params[:sort]) ? params[:sort] : "id"
 end
 
 def sort_direction
   %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
 end    


end
