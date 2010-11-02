class CreateQuestionTypes < ActiveRecord::Migration
  def self.up
    create_table :question_types do |t|
      t.string :label
      t.text :description
    end
  end

  def self.down
    drop_table :question_types
  end
end
