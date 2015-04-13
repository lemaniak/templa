class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :picture
      t.integer :creation_date

      t.timestamps null: false
    end
  end
end
