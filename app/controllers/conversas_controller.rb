class ConversasController < ActionController::Base
  before_action :set_conversa, only: [:show, :edit, :update, :destroy]

  # GET /conversas
  # GET /conversas.json
  def index

    if params[:id] and params[:id_anuncio]
      @conversas = Conversa.where('id > ? and id_anuncio = ?', params[:id], params[:id_anuncio])
    else  
      @conversas = Conversa.all
    end   

  end

  # GET /conversas/1
  # GET /conversas/1.json
  def show
  end

  # GET /conversas/new
  def new
    @conversa = Conversa.new
  end

  # GET /conversas/1/edit
  def edit
  end

  # POST /conversas
  # POST /conversas.json
  def create
    @conversa = Conversa.new(conversa_params)

    respond_to do |format|
      if @conversa.save
        format.html { redirect_to @conversa, notice: 'Conversa was successfully created.' }
        format.json { render :show, status: :created, location: @conversa }
      else
        format.html { render :new }
        format.json { render json: @conversa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conversas/1
  # PATCH/PUT /conversas/1.json
  def update
    respond_to do |format|
      if @conversa.update(conversa_params)
        format.html { redirect_to @conversa, notice: 'Conversa was successfully updated.' }
        format.json { render :show, status: :ok, location: @conversa }
      else
        format.html { render :edit }
        format.json { render json: @conversa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversas/1
  # DELETE /conversas/1.json
  def destroy
    @conversa.destroy
    respond_to do |format|
      format.html { redirect_to conversas_url, notice: 'Conversa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversa
      @conversa = Conversa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversa_params
      params.require(:conversa).permit(:id_anuncio, :id_usuario_remetente, :mensagem)
    end
end
