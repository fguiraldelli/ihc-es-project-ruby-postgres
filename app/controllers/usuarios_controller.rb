class UsuariosController < ActionController::Base
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]


  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.all

    if params[:token]
       @usuarios = Usuario.search(params[:token])
    else   
       @usuarios = Usuario.all.order('created_at DESC')
    end

  end
  
  # POST /avaliar  ex.: {"token":"cnbfheurjfnw", "id":"7", "avaliacao":"+"}
  def avaliar
    @anuncio = Anuncio.find(params[:id])

    @usuario = Usuario.find(@anuncio.id_usuario)

    if params[:avaliacao] == "+"
        @usuario.positivo += 1
    elsif params[:avaliacao] == "-"
        @usuario.negativo += 1
    end
    
    @usuario.save        

  end  
 
  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    
    @usuario = Usuario.find_idFacebook(params[:id_facebook])

    if !@usuario.nil?
      self.update
    else
      @usuario = Usuario.new(usuario_params)

      @usuario.positivo = 1
      @usuario.negativo = 1
      #@usuario.celular  = "(15) 99#{Random.rand(100..899)}-#{Random.rand(1000..9999)}"

      respond_to do |format|
        if @usuario.save
          format.html { redirect_to @usuario, notice: 'Usuario was successfully created.' }
          format.json { render :show, status: :created, location: @usuario }
        else
          format.html { render :new }
          format.json { render json: @usuario.errors, status: :unprocessable_entity }
        end
      end
    end

  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:nome, :sexo, :celular, :id_instituicao, :id_facebook, :token, :positivo, :negativo)
    end
end
