class Curso < ActiveRecord::Base

	validates_presence_of :nombre, :message => "no ha sido ingresado."
	validates_presence_of :formula, :message => "no ha sido ingresada."
	
	before_save :validateFormula

  def validateFormula  
    acumulado = 0
    
    formulaPlus = self[:formula].split("+")
    if formulaPlus==''
      errors.add(:formula," es incorrecta.")
      return false
    end

    for i in 0..formulaPlus.length-1
    	pesoXExam = formulaPlus[i].scan(/\d\d%[A-Z0-9]+/)
    	if pesoXExam.length == 0
    		errors.add(:formula," es incorrecta.")
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
      errors.add(:formula," no llega al 100%.") 

     
      return false
    end

  end
end
