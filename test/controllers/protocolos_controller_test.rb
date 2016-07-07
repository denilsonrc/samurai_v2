require 'test_helper'

class ProtocolosControllerTest < ActionController::TestCase
  setup do
    @protocolo = protocolos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:protocolos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create protocolo" do
    assert_difference('Protocolo.count') do
      post :create, protocolo: { nome: @protocolo.nome }
    end

    assert_redirected_to protocolo_path(assigns(:protocolo))
  end

  test "should show protocolo" do
    get :show, id: @protocolo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @protocolo
    assert_response :success
  end

  test "should update protocolo" do
    patch :update, id: @protocolo, protocolo: { nome: @protocolo.nome }
    assert_redirected_to protocolo_path(assigns(:protocolo))
  end

  test "should destroy protocolo" do
    assert_difference('Protocolo.count', -1) do
      delete :destroy, id: @protocolo
    end

    assert_redirected_to protocolos_path
  end
end
