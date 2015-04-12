class CreateGames < ActiveRecord::Migration
  def change
  	create_table :games do |t|
  		t.belongs_to :player1_id
  		t.belongs_to :player2_id
  		t.string :status, default: "Waiting"
  		t.integer :count, default: 0
  		t.string :winner ,default: ""
  		t.timestamps null:false
  	end
  end
end
