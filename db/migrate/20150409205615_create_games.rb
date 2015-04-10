class CreateGames < ActiveRecord::Migration
  def change
  	create_table :games do |t|
  		t.integer :player1_id
  		t.integer :player2_id
  		t.integer :count, default: 0
  		t.string :winner ,default: ""
  		t.timestamps null:false
  	end
  end
end
