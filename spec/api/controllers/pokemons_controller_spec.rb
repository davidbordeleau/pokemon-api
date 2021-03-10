require 'rails_helper'

describe Api::PokemonsController, type: :controller do
  describe '.show' do
    subject { get :show, params: params }

    context 'with an non existing id' do
      let(:params) do
        { id: 999 }
      end

      it 'returns an not found error' do
        expect(subject.status).to eq(404)
      end
    end

    context 'with an existing id' do
      let!(:pokemon) { Pokemon.create(name: 'a pokemon') }

      let(:params) do
        { id: pokemon.id }
      end

      it 'finds the pokemon' do
        expect(subject.status).to eq(200)
      end
    end
  end

  describe '.create' do
    it 'finds the route' do
      expect(post: '/api/pokemons?name=poke').to route_to(controller: 'api/pokemons', action: 'create', name: 'poke')
    end

    it 'creates a pokemon' do
      post :create, params: { name: 'new created name', type_one: 'new type' }
      expect(Pokemon.last.name).to eq('new created name')
    end
  end

  describe '.update' do
    let!(:pokemon) { Pokemon.create(name: 'a pokemon') }
    it 'finds the route' do
      expect(post: '/api/pokemons?name=poke').to route_to(controller: 'api/pokemons', action: 'create', name: 'poke')
    end

    it 'updates the pokemon' do
      expect(pokemon.name).to eq('a pokemon')
      put :update, params: { id: pokemon.id, name: 'new name', type_one: 'new type' }
      pokemon.reload
      expect(pokemon.name).to eq('new name')
    end
  end

  describe '.destroy' do
    context 'test routing' do
      let!(:pokemon) { Pokemon.create(name: 'a newly created pokemon') }

      it 'deletes the pokemon' do
        expect(Pokemon.find_by(name: 'a newly created pokemon')).to_not be_nil
        post :destroy, params: { id: pokemon.id }
        expect(Pokemon.find_by(name: 'a newly created pokemon')).to be_nil
      end
    end
  end
end
