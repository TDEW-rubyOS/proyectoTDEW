class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :nombre
      t.string :formula
      t.integer :cantpcs
      t.boolean :exafinal
      t.boolean :proyecto

      t.timestamps
    end
  end
end
