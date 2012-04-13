require "./CursoTest.rb"

describe CursoTest do



	it "valida formula vacia " do
		@cursoTest = CursoTest.new("")
		@cursoTest.validateFormula.should be_false
	end

    it "valida formula con mal formato " do
    	@cursoTest = CursoTest.new("15%PC1+15PC2+20%TP+20%PA+30%TF")
	
		@cursoTest.validateFormula.should be_false
	end

	it "valida formula con buen formato " do
		@cursoTest = CursoTest.new("15%PC1+15%PC2+20%TP+20%PA+30%TF")
		
		@cursoTest.validateFormula.should be_true
	end


end