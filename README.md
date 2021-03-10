# README

Procédure d'installation locale du pokemon api
========================================================

Cloner une **nouvelle copie** de pokemon api ex.:

```bash
git clone 'git@github.com:davidbordeleau/pokemon-api.git' pokemon-api
cd pokemon-api
bundle install
```

Préparer et importer les données de base du fichier csv
```bash
rails db:migrate
rails db:seed
```

Lancer le serveur rails pour tester sur postman
```bash
rails s
```

☝️ Les appels apis seront sur la route api/pokemons avec kaminari pagination ex.:
```
http://localhost:3000/api/pokemons?page=2

```

Pour tester le specs
```bash
rails db:test:prepare
rspec ./spec/api/controllers/pokemons_controller_spec.rb
```
