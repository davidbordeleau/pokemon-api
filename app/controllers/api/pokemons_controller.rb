class Api::PokemonsController < ActionController::API
  def index
    pokemons = Kaminari.paginate_array(Pokemon.all).page(params[:page]).per(10)
    render json: pokemons
  end

  def show
    return render plain: 'Not Found', status: 404 unless pokemon = find_pokemon

    render json: pokemon
  end

  def create
    new_pokemon = Pokemon.new(pokemon_params)

    if new_pokemon.save
      status = "Pokemon #{new_pokemon.name} with id #{new_pokemon.id} created"
    else
      status = "Cannot save new pokemon #{new_pokemon.errors.messages}"
    end

    render plain: status
  end

  def update
    return render plain: 'Not Found', status: 404 unless pokemon = find_pokemon

    if pokemon.update(pokemon_params)
      status = "Pokemon updated"
    else
      status = "Cannot update #{pokemon.errors.messages}"
    end

    render plain: status
  end

  def destroy
    return render plain: 'Not Found', status: 404 unless pokemon = find_pokemon

    if pokemon.delete
      status = "Pokemon #{pokemon.name} deleted"
    else
      statue = 'Cannot delete'
    end

    render plain: status
  end

  private

  def find_pokemon 
    Pokemon.find_by(id: params[:id])
  end

  def pokemon_params
    params.permit([
      :row_id,
      :name,
      :type_one,
      :type_two,
      :total,
      :hp,
      :attack,
      :defence,
      :sp_attack,
      :sp_defence,
      :speed,
      :generation,
      :legendary
    ])
  end
end
