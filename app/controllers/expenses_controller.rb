class ExpensesController < ApplicationController
  load_and_authorize_resource
  before_filter :load_by_pagination, :only => :index
  helper_method :sort_column, :sort_direction
  # GET /expenses
  # GET /expenses.json
  def index
   # @expenses = Expense.order(sort_column + ' ' + sort_direction).paginate(:per_page => 20, :page => params[:page])
  # @expense_by_json = @expenses = Expense.filter_by_date(params[:expenses_date_from],params[:expenses_date_to]).filter_by_job_id(params[:job_id]).filter_by_user_id(params[:user_id]).filter_by_category_id(params[:expense_category_id])

    respond_to do |format|
      format.html # index.html.erb
   #   format.json { render json: @expense_by_json  }
    end
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
    @expense = Expense.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @expense }
    end
  end

  # GET /expenses/new
  # GET /expenses/new.json
  def new
    @expense = Expense.new
    @expense_type = ExpenseType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @expense }
    end
  end

  # GET /expenses/1/edit
  def edit
    @expense = Expense.find(params[:id])
    @expense_type = ExpenseType.new
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Expense.new(params[:expense])
    @refund = Refund.find_by_code(params[:expense]["refund_id"])
    @expense.refund_id = @refund.id if !@refund.nil? && !@refund.id.nil?
    @expense.user_id = current_user.id

    respond_to do |format|
      if @expense.save
        format.html { redirect_to @expense, notice: 'El gasto ha sido registrado.' }
        format.json { render json: @expense, status: :created, location: @expense }
      else
        format.html { render action: "new" }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /expenses/1
  # PUT /expenses/1.json
  def update
    @expense = Expense.find(params[:id])
    @refund = Refund.find_by_code(params[:expense]["refund_id"])
    params[:expense]["refund_id"] = @refund.id if !@refund.nil? && !@refund.id.nil?
    @expense.user_id = current_user.id

    respond_to do |format|
      if @expense.update_attributes(params[:expense])
        format.html { redirect_to @expense, notice: 'El gasto ha sido actualizado.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      #  format.js
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy

    respond_to do |format|
      format.html { redirect_to expenses_url }
      format.json { head :no_content }
    end
  end

  def find_expenses
      @refund_id = params[:refund_id]
      @expenses = Expense.filter_by_date(params[:expenses_date_from],params[:expenses_date_to]).filter_by_job_id(params[:job_id]).filter_by_user_id(params[:user_id]).filter_by_category_id(params[:expense_category_id])
      
      render :partial => "expenses_searched.js.erb"
  end

  def find_expenses_for_excel
    @exp = Expense.filter_by_date(params[:expenses_date_from],params[:expenses_date_to]).filter_by_job_id(params[:job_id]).filter_by_user_id(params[:user_id]).filter_by_category_id(params[:expense_category_id])
      respond_to do |format|
        format.xls
      end
  end

  def find_expenses_form
      @refund_id = params[:refund_id]
      @expenses = Expense.filter_by_date(params[:expenses_date_from],params[:expenses_date_to]).filter_by_job_id(params[:job_id]).filter_by_user_id(params[:user_id]).filter_by_category_id(params[:expense_category_id])

      render :partial => "filter_expenses_form.js.erb"
  end

  def find_expenses_excel_form
      @expenses = Expense.filter_by_date(params[:expenses_date_from],params[:expenses_date_to]).filter_by_job_id(params[:job_id]).filter_by_user_id(params[:user_id]).filter_by_category_id(params[:expense_category_id])
      render :partial => "find_expenses_excel_form.js.erb"
  end

  def update_expenses_types_select
      @expenses_types = []
      if params[:expense][:expense_category_id].size > 0
        @expenses_types = ExpenseType.find_all_by_expense_category_id(params[:expense][:expense_category_id])
      end
      render :partial => "expenses_types.js.erb"
  end

  def load_by_pagination
    if !params[:search].nil? && params[:search].size > 0
      search = "#{params[:search]}"
      @expenses = Expense.accessible_by(current_ability).where("id = ? ", search).order(params[:sort]).paginate(:per_page => 10, :page => params[:page]).order(params[:sort])
    else
      @expenses = Expense.accessible_by(current_ability).order(params[:sort]).paginate(:per_page => 10, :page => params[:page])      
    end
  end

  private
  def sort_column
   Expense.column_names.include?(params[:sort]) ? params[:sort] : "id"
 end
 
 def sort_direction
   %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
 end    
end
