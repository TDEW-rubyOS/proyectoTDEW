class CursosController < ApplicationController


  USER_ID, PASSWORD = "admin", "1234"

  # Requiere autenticacion solo para admin, crear y editar
  before_filter :authenticate, :only => [:index]

  # GET /cursos
  # GET /cursos.json
  def index
    @cursos = Curso.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cursos }
    end
  end

  # GET /cursos/1
  # GET /cursos/1.json
  def show
    @curso = Curso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @curso }
    end
  end

  # GET /cursos/new
  # GET /cursos/new.json
  def new
    @curso = Curso.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @curso }
    end
  end

  # GET /cursos/1/edit
  def edit
    @curso = Curso.find(params[:id])
  end

  # POST /cursos
  # POST /cursos.json
  def create
    @curso = Curso.new(params[:curso])

    respond_to do |format|
      if @curso.save
        format.html { redirect_to @curso, notice: 'Curso was successfully created.' }
        format.json { render json: @curso, status: :created, location: @curso }
      else
        format.html { render action: "new" }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cursos/1
  # PUT /cursos/1.json
  def update
    @curso = Curso.find(params[:id])

    respond_to do |format|
      if @curso.update_attributes(params[:curso])
        format.html { redirect_to @curso, notice: 'Curso was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @curso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cursos/1
  # DELETE /cursos/1.json
  def destroy
    @curso = Curso.find(params[:id])
    @curso.destroy

    respond_to do |format|
      format.html { redirect_to cursos_url }
      format.json { head :no_content }
    end
  end

  def ingresar_notas       
      if params[:id]
        @curso = Curso.find(params[:id])
        puts "holaaa" +@curso.formula
      #else
       # @curso = Curso.find(1)
      end
      @cursos = Curso.all

        respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @curso }        
      end
  end

  def resultado
      cursoFormula = params[:formula]
     
      elementos = cursoFormula.split("+")
      promedio = 0.0
      faltante = 0
      @notaNecesaria =0
      for i in 0..elementos.length
      
            elementoTemp =  elementos[i].to_s.split("%")                        
            #puts "ARREGLO "+elementoTemp[0] + ", " +elementoTemp[1]
            nota  = params[elementoTemp[1]]
            porcentaje = elementoTemp[0]/100
            promedio = promedio +  (nota*porcentaje)
            promedio = promedio.round(2)
            
            if elementoTemp[1] == "TF"
              faltante = 12.5 - promedio
              if faltante > 0
              
                @notaNecesaria = faltante/porcentaje
                @notaNecesaria = @notaNecesaria.round(2)
              end
            end
            
      end

      respond_to do |format|
        format.html # show.html.erb        
      end
  end


  private
  def authenticate
      authenticate_or_request_with_http_basic do |id, password| 
          id == USER_ID && password == PASSWORD
      end
   end

end
