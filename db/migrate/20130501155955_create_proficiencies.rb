class CreateProficiencies < ActiveRecord::Migration
  def change

    create_table :proficiencies do |t|

      t.integer :user_id
      t.integer :skill_id
      t.integer :years_experience
      t.boolean :formal_education

      t.timestamps
    end
  end
end
