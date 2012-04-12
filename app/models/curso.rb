class Curso < ActiveRecord::Base

	validates_presence_of :nombre, :message => "Ingrese un nombre"
	validates_presence_of :formula, :message => "Ingrese la formula"


end
