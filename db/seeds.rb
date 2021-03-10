require 'csv'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CSV.foreach('./db/pokemon.csv', headers: :first_row, header_converters: :symbol) do |row|
	pokemon = Pokemon.new
	pokemon.name = row[1]
	pokemon.type_one = row[2]
	pokemon.type_two = row[3]
	pokemon.total = row[4]
	pokemon.hp = row[5]
	pokemon.attack = row[6]
	pokemon.defence = row[7]
	pokemon.sp_attack = row[8]
	pokemon.sp_defence = row[9]
	pokemon.speed = row[10]
	pokemon.generation = row[11]
	pokemon.legendary = row[12]

	if pokemon.save
		puts "created #{pokemon.name}!"
	else
		puts "ERROR cannot create #{pokemon.name}. Details: #{pokemon.message.errors}"
	end
end
