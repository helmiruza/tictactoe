class CreateBoxes < ActiveRecord::Migration
  def change
  	create_table :boxes do |t|
  		t.integer :position
  		t.string :value
  		t.integer :game_id
  		t.timestamps null:false
  	end
  end
end
