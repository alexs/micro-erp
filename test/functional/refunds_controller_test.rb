require 'test_helper'

class RefundsControllerTest < ActionController::TestCase
  setup do
    @refund = refunds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:refunds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create refund" do
    assert_difference('Refund.count') do
      post :create, refund: { amount: @refund.amount, code: @refund.code, date_deposit: @refund.date_deposit }
    end

    assert_redirected_to refund_path(assigns(:refund))
  end

  test "should show refund" do
    get :show, id: @refund
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @refund
    assert_response :success
  end

  test "should update refund" do
    put :update, id: @refund, refund: { amount: @refund.amount, code: @refund.code, date_deposit: @refund.date_deposit }
    assert_redirected_to refund_path(assigns(:refund))
  end

  test "should destroy refund" do
    assert_difference('Refund.count', -1) do
      delete :destroy, id: @refund
    end

    assert_redirected_to refunds_path
  end
end
