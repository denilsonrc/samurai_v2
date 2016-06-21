require 'test_helper'

class EquipamentosControllerTest < ActionController::TestCase
  setup do
    @equipamento = equipamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equipamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equipamento" do
    assert_difference('Equipamento.count') do
      post :create, equipamento: { ip: @equipamento.ip, mac: @equipamento.mac, nome: @equipamento.nome, sala_id: @equipamento.sala_id, status: @equipamento.status, tipo_id: @equipamento.tipo_id }
    end

    assert_redirected_to equipamento_path(assigns(:equipamento))
  end

  test "should show equipamento" do
    get :show, id: @equipamento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @equipamento
    assert_response :success
  end

  test "should update equipamento" do
    patch :update, id: @equipamento, equipamento: { ip: @equipamento.ip, mac: @equipamento.mac, nome: @equipamento.nome, sala_id: @equipamento.sala_id, status: @equipamento.status, tipo_id: @equipamento.tipo_id }
    assert_redirected_to equipamento_path(assigns(:equipamento))
  end

  test "should destroy equipamento" do
    assert_difference('Equipamento.count', -1) do
      delete :destroy, id: @equipamento
    end

    assert_redirected_to equipamentos_path
  end
end
