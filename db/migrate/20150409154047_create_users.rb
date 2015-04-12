class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.column :username, :string, limit:64
			t.column :password, :string, limit:64
			t.integer :points, default: 0
			t.timestamps null:false
		end
	end
end
