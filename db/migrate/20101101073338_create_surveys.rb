class CreateSurveys < ActiveRecord::Migration
  def self.up
	create_table :surveys do |t|
  		t.integer :user_id
		t.string :title
		t.string :description
		t.integer :layout_id
  	end
  end

  def self.down
	drop_table :surveys
  end

end
