require 'test_helper'

class PaytypesControllerTest < ActionController::TestCase
  setup do
    @paytype = paytypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paytypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paytype" do
    assert_difference('Paytype.count') do
      post :create, paytype: { pay_type: @paytype.pay_type }
    end

    assert_redirected_to paytype_path(assigns(:paytype))
  end

  test "should show paytype" do
    get :show, id: @paytype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @paytype
    assert_response :success
  end

  test "should update paytype" do
    put :update, id: @paytype, paytype: { pay_type: @paytype.pay_type }
    assert_redirected_to paytype_path(assigns(:paytype))
  end

  test "should destroy paytype" do
    assert_difference('Paytype.count', -1) do
      delete :destroy, id: @paytype
    end

    assert_redirected_to paytypes_path
  end
end
