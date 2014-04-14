class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		 t.string :name
  		 t.string :date
  		 t.integer :send
  		 t.integer :open
  		 t.integer :clickpc
  		 t.integer :clickpcnumber
  		 t.integer :clicksp
  		 t.integer :clickspnuymber
  		 t.integer :sendclick
  		 t.integer :sendopen
  		 t.integer :favorite
  		 t.integer :apply
  		 t.integer :applypass
  		end
  end
end
