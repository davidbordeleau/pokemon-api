require 'csv'

CSV.foreach('./db/pokemon.csv', headers: :first_row, header_converters: :symbol) do |row|
  pokemon = Pokemon.new

  pokemon.name = row[:name]
  pokemon.type_one = row[:type_one]
  pokemon.type_two = row[:type_two]
  pokemon.total = row[:total]
  pokemon.hp = row[:hp]
  pokemon.attack = row[:attack]
  pokemon.defence = row[:defence]
  pokemon.sp_attack = row[:sp_attack]
  pokemon.sp_defence = row[:sp_defence]
  pokemon.speed = row[:speed]
  pokemon.generation = row[:generation]
  pokemon.legendary = row[:legendary]

  if pokemon.save
    puts "created #{pokemon.name}!"
  else
    puts "ERROR cannot create #{pokemon.name}. Details: #{pokemon.errors.messages}"
  end
end
