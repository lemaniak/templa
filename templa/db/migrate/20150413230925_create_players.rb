class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :age
      t.string :lastname
      t.integer :salary
      t.integer :birthdate
      t.integer :position,default:0
      t.integer :status,default:0
      t.references :team, index: true

      t.timestamps null: false
    end
    add_foreign_key :players, :teams
  end
end
