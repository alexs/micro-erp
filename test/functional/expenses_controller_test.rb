require 'test_helper'

class ExpensesControllerTest < ActionController::TestCase
  setup do
    @expense = expenses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expense" do
    assert_difference('Expense.count') do
      post :create, expense: { date: @expense.date, expense_code: @expense.expense_code, file1: @expense.file1, file2: @expense.file2, file3: @expense.file3, invoice: @expense.invoice, iva: @expense.iva, subtotal: @expense.subtotal, total: @expense.total, usd_aop: @expense.usd_aop }
    end

    assert_redirected_to expense_path(assigns(:expense))
  end

  test "should show expense" do
    get :show, id: @expense
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expense
    assert_response :success
  end

  test "should update expense" do
    put :update, id: @expense, expense: { date: @expense.date, expense_code: @expense.expense_code, file1: @expense.file1, file2: @expense.file2, file3: @expense.file3, invoice: @expense.invoice, iva: @expense.iva, subtotal: @expense.subtotal, total: @expense.total, usd_aop: @expense.usd_aop }
    assert_redirected_to expense_path(assigns(:expense))
  end

  test "should destroy expense" do
    assert_difference('Expense.count', -1) do
      delete :destroy, id: @expense
    end

    assert_redirected_to expenses_path
  end
end
