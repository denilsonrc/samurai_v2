require 'test_helper'

class HistoricoEquipamentosControllerTest < ActionController::TestCase
  setup do
    @historico_equipamento = historico_equipamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historico_equipamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historico_equipamento" do
    assert_difference('HistoricoEquipamento.count') do
      post :create, historico_equipamento: { dado: @historico_equipamento.dado, status: @historico_equipamento.status, tempo: @historico_equipamento.tempo }
    end

    assert_redirected_to historico_equipamento_path(assigns(:historico_equipamento))
  end

  test "should show historico_equipamento" do
    get :show, id: @historico_equipamento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @historico_equipamento
    assert_response :success
  end

  test "should update historico_equipamento" do
    patch :update, id: @historico_equipamento, historico_equipamento: { dado: @historico_equipamento.dado, status: @historico_equipamento.status, tempo: @historico_equipamento.tempo }
    assert_redirected_to historico_equipamento_path(assigns(:historico_equipamento))
  end

  test "should destroy historico_equipamento" do
    assert_difference('HistoricoEquipamento.count', -1) do
      delete :destroy, id: @historico_equipamento
    end

    assert_redirected_to historico_equipamentos_path
  end
end
