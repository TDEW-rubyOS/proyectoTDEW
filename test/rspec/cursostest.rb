class CursoTest

    #atributos
    attr_reader :nombre
    attr_reader :formula        

    

  def validateFormula 
    acumulado = 0
    
    formulaPlus = :formula.split("+")
    if formulaPlus==''
     
      return false
    end

    for i in 0..formulaPlus.length-1
        pesoXExam = formulaPlus[i].scan(/\d\d%[A-Z0-9]+/)
        if pesoXExam.length == 0
            
            return false
        end
    end

    pesos = self[:formula].scan(/\d\d/)
    for i in 0..pesos.length-1
       acumulado  = acumulado  + pesos[i].to_i
    end
   
    if acumulado == 100

      return true
    else
     puts "NO llega al 100%" 

     
      return false
    end

  end
end