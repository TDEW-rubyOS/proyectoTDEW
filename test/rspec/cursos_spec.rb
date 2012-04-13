require "./cursostest.rb"

describe CursosTest do

	before(:each) do
		@cursosTest = CursoTest.new
	end

	it "valida formula vacia " do
		@cursosTest.formula = ""
		@cursosTest.validateFormula.should be_false
	end

    it "valida formula con mal formato " do
		@cursosTest.formula = "15%PC1+15PC2+20%TP+20%PA+30%TF"
		@cursosTest.validateFormula.should be_false
	end

	it "valida formula con buen formato " do
		@cursosTest.formula = "15%PC1+15%PC2+20%TP+20%PA+30%TF"
		@cursosTest.validateFormula.should be_true
	end


end