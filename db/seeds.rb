# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
store1 = Store.create(name: 'Pallet Store', address: '1234 Pallet town')
store2 = Store.create(name: 'Veridian Store', address: '1234 Veridian city')
store3 = Store.create(name: 'Pewter city', address: '1234 Pewter city')

article1 = Article.create(name: 'Fast shoes', description: 'These are shoes', price: '100.00', total_in_shelf: '4', total_in_vault: '2', store_id: '')
article2 = Article.create(name: 'Heavy shoes', description: 'These are shoes', price: '150.00', total_in_shelf: '4', total_in_vault: '3', store_id: '')
article3 = Article.create(name: 'Water shoes', description: 'These are shoes', price: '170.00', total_in_shelf: '4', total_in_vault: '4', store_id: '')
article4 = Article.create(name: 'Sprint shoes', description: 'These are shoes', price: '100.00', total_in_shelf: '4', total_in_vault: '5', store_id: '')
article5 = Article.create(name: 'Flying shoes', description: 'These are shoes', price: '300.00', total_in_shelf: '4', total_in_vault: '6', store_id: '')

store1.articles << article1
store1.articles << article2
store2.articles << article3
store2.articles << article4
store3.articles << article5
