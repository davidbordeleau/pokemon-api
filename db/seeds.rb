require 'csv'

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
    puts "ERROR cannot create #{pokemon.name}. Details: #{pokemon.errors.messages}"
  end
end
