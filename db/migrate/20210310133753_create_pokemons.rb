class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :type_one
      t.string :type_two
      t.integer :total
      t.integer :hp
      t.integer :attack
      t.integer :defence
      t.integer :sp_attack
      t.integer :sp_defence
      t.integer :speed
      t.integer :generation
      t.boolean :legendary

      t.timestamps
    end
  end
end
