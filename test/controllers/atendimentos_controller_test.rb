require 'test_helper'

class AtendimentosControllerTest < ActionController::TestCase
  setup do
    @atendimento = atendimentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:atendimentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create atendimento" do
    assert_difference('Atendimento.count') do
      post :create, atendimento: { customer: @atendimento.customer, date: @atendimento.date, description: @atendimento.description }
    end

    assert_redirected_to atendimento_path(assigns(:atendimento))
  end

  test "should show atendimento" do
    get :show, id: @atendimento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @atendimento
    assert_response :success
  end

  test "should update atendimento" do
    patch :update, id: @atendimento, atendimento: { customer: @atendimento.customer, date: @atendimento.date, description: @atendimento.description }
    assert_redirected_to atendimento_path(assigns(:atendimento))
  end

  test "should destroy atendimento" do
    assert_difference('Atendimento.count', -1) do
      delete :destroy, id: @atendimento
    end

    assert_redirected_to atendimentos_path
  end
end
