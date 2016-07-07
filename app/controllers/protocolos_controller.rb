class ProtocolosController < ApplicationController
  before_action :set_protocolo, only: [:show, :edit, :update, :destroy]

  # GET /protocolos
  # GET /protocolos.json
  def index
    @protocolos = Protocolo.all
  end

  # GET /protocolos/1
  # GET /protocolos/1.json
  def show
  end

  # GET /protocolos/new
  def new
    @protocolo = Protocolo.new
  end

  # GET /protocolos/1/edit
  def edit
  end

  # POST /protocolos
  # POST /protocolos.json
  def create
    @protocolo = Protocolo.new(protocolo_params)

    respond_to do |format|
      if @protocolo.save
        #format.html { redirect_to @protocolo, notice: 'Protocolo was successfully created.' }
        #format.json { render :show, status: :created, location: @protocolo }
        format.html { redirect_to new_equipamento_path, notice: 'Protocolo registrado com sucesso' }
      else
        format.html { render :new }
        format.json { render json: @protocolo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /protocolos/1
  # PATCH/PUT /protocolos/1.json
  def update
    respond_to do |format|
      if @protocolo.update(protocolo_params)
        format.html { redirect_to @protocolo, notice: 'Protocolo was successfully updated.' }
        format.json { render :show, status: :ok, location: @protocolo }
      else
        format.html { render :edit }
        format.json { render json: @protocolo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /protocolos/1
  # DELETE /protocolos/1.json
  def destroy
    @protocolo.destroy
    respond_to do |format|
      format.html { redirect_to protocolos_url, notice: 'Protocolo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_protocolo
      @protocolo = Protocolo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def protocolo_params
      params.require(:protocolo).permit(:nome)
    end
end
