# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all

Product.create!(
  title: 'Capitán Kidd',
  description: 'Arehucas criado y almacenado durante 30 años',
  image_url: 'kidd.png',
  price: 100.00)

Product.create!(
  title: 'Plátanos de Canarias',
  description: 'Los mejores plátanos del mundo según los ¿expertos?',
  image_url: 'platanos.png',
  price: 8.00)

Product.create!(
  title: 'Clipper de Fresa',
  description: 'La bebida gaseosa por excelencia de todos los canarios',
  image_url: 'clipper.png',
  price: 1.50)

Product.create!(
  title: 'Gofio La Piña',
  description: 'Gofio con sabor auténtico canario',
  image_url: 'gofio.png',
  price: 1.89)
