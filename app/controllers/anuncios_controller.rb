class AnunciosController < ActionController::Base
  before_action :set_anuncio, only: [:show, :edit, :update, :destroy]


  # rota específica para trazer as 4 fotos restante
  def fotos
    #implementar ...
    @anuncio = Anuncio.find(params[:id])
    render json: @anuncio.imagem
  end  

  def eventos
    if params[:id_local]
      @anuncios = Anuncio.eventos(:id_local)
      
      render json: @anuncios.to_json 

    end  
  end


  # GET /anuncios
  # GET /anuncios.json
  def index
    #@anuncios = Anuncio.all

    # busca ordenada por pontos do anunciante e data de criação, somente negocios NÃO fechados
    if params[:search]
      @anuncios = Anuncio.search(params[:search]).sort_by{|obj| [obj.pontosanunciante, obj.created_at]}.reverse
    
    elsif params[:token]
      # busca meus anuncios
       @anuncios = Anuncio.meusanuncios(params[:token]).order("created_at DESC")  

    elsif params[:id_local]

      @anuncios = Anuncio.maispopulares(:id_local)

    else  
      # listagem geral
      @anuncios = Anuncio.all.order('created_at DESC')
    end  

  end


  # GET /anuncios/1
  # GET /anuncios/1.json
  def show
    @anuncio.visualizacoes += 1
    @anuncio.save
  end

  # GET /anuncios/new
  def new
    @anuncio = Anuncio.new
  end

  # GET /anuncios/1/edit
  def edit
  end

  # POST /anuncios
  # POST /anuncios.json
  def create
    @anuncio = Anuncio.new(anuncio_params)
    @anuncio.id_usuario = Usuario.find_token(@anuncio.token).id
    @anuncio.negocio_fechado = false
    @anuncio.visualizacoes = 0
    Termo.gravartermo(@anuncio.titulo)
    #Termo.gravartermo(@anuncio.descricao)

    respond_to do |format|
      if @anuncio.save
        format.html { redirect_to @anuncio, notice: 'Anuncio was successfully created.' }
        format.json { render :show, status: :created, location: @anuncio }
      else
        format.html { render :new }
        format.json { render json: @anuncio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anuncios/1
  # PATCH/PUT /anuncios/1.json
  def update
    respond_to do |format|
      if @anuncio.update(anuncio_params)
        format.html { redirect_to @anuncio, notice: 'Anuncio was successfully updated.' }
        format.json { render :show, status: :ok, location: @anuncio }
      else
        format.html { render :edit }
        format.json { render json: @anuncio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anuncios/1
  # DELETE /anuncios/1.json
  def destroy
    @anuncio.destroy
    respond_to do |format|
      format.html { redirect_to anuncios_url, notice: 'Anuncio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anuncio
      @anuncio = Anuncio.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anuncio_params
      params.require(:anuncio).permit(:titulo, :descricao, :preco, :diassemana,:tipoanuncio,:datahoraevento, :imagem, :imagem2, :imagem3, :imagem4, :imagem5, :token, :negocio_fechado, :id_usuario)
    end
end
