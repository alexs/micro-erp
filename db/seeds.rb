# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(:name => "Administrador", :surname => "admin", :email => "admin@mail.com", :role_id => 1, :password => "admin",
	:password_confirmation => "admin", :role_id => 1)

JobType.create!([{ name: 'Proyecto' }, { name: 'Servicio' }])

Job.create!(name: "Proyecto prueba", status_id: 1, sold: true, user_id: 1,  job_type_id: 1)

ExpenseType.create!([{ name: 'Avion' }, { name: 'Taxi' }, { name: 'Comida' }])

ExpenseCategory.create!([{ id: 1, name: 'Gasto de venta' }, { id: 2, name: 'Gasto de proyecto/servicio' }, { id: 3, name: 'Gasto de Operacion' }])