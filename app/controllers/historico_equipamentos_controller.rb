class HistoricoEquipamentosController < ApplicationController
  before_action :set_historico_equipamento, only: [:show, :edit, :update, :destroy]

  # GET /historico_equipamentos
  # GET /historico_equipamentos.json
  def index
    @historico_equipamentos = HistoricoEquipamento.all
  end

  # GET /historico_equipamentos/1
  # GET /historico_equipamentos/1.json
  def show
  end

  # GET /historico_equipamentos/new
  def new
    @historico_equipamento = HistoricoEquipamento.new
  end

  # GET /historico_equipamentos/1/edit
  def edit
  end

  # POST /historico_equipamentos
  # POST /historico_equipamentos.json
  def create
    @historico_equipamento = HistoricoEquipamento.new(historico_equipamento_params)

    respond_to do |format|
      if @historico_equipamento.save
        format.html { redirect_to @historico_equipamento, notice: 'Historico equipamento was successfully created.' }
        format.json { render :show, status: :created, location: @historico_equipamento }
      else
        format.html { render :new }
        format.json { render json: @historico_equipamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historico_equipamentos/1
  # PATCH/PUT /historico_equipamentos/1.json
  def update
    respond_to do |format|
      if @historico_equipamento.update(historico_equipamento_params)
        format.html { redirect_to @historico_equipamento, notice: 'Historico equipamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @historico_equipamento }
      else
        format.html { render :edit }
        format.json { render json: @historico_equipamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historico_equipamentos/1
  # DELETE /historico_equipamentos/1.json
  def destroy
    @historico_equipamento.destroy
    respond_to do |format|
      format.html { redirect_to historico_equipamentos_url, notice: 'Historico equipamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historico_equipamento
      @historico_equipamento = HistoricoEquipamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historico_equipamento_params
      params.require(:historico_equipamento).permit(:status, :tempo, :dado)
    end
end
