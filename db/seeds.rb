#encoding: utf-8 
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

ExpenseType.create!([{ name: 'Alimentos en viaje', expense_category_id: 1 },
	{ name: 'Avión', expense_category_id: 1 },
	{ name: 'Caseta', expense_category_id: 1 },
	{ name: 'Desconocido', expense_category_id: 1 },
	{ name: 'Estacionamiento', expense_category_id: 1 },
	{ name: 'Gasolina', expense_category_id: 1 },
	{ name: 'Hotel', expense_category_id: 1 },
	{ name: 'Líquido para Autos', expense_category_id: 1 },
	{ name: 'Renta Auto', expense_category_id: 1 }, 
	{ name: 'Taxi', expense_category_id: 1 }, 
	{ name: 'Transporte', expense_category_id: 1 }, 
	{ name: 'Transporte Autobús', expense_category_id: 1 }, 

	{ name: 'Avión', expense_category_id: 2 },
	{ name: 'Caseta', expense_category_id: 2 },
	{ name: 'Desconocido', expense_category_id: 2 },
	{ name: 'Estacionamiento', expense_category_id: 2 },
	{ name: 'Gasolina', expense_category_id: 2 },
	{ name: 'Hotel', expense_category_id: 2 },
	{ name: 'Líquido para Autos', expense_category_id: 2 },
	{ name: 'Renta Auto', expense_category_id: 2 }, 
	{ name: 'Taxi', expense_category_id: 2 }, 
	{ name: 'Transporte', expense_category_id: 2 }, 
	{ name: 'Transporte Autobús', expense_category_id: 2 }
	])


ExpenseCategory.create!([{ id: 1, name: 'Gasto de venta' }, { id: 2, name: 'Gasto de proyecto/servicio' }, { id: 3, name: 'Gasto de Operación' }])

Setting.create!(usd: 12, user_id: 1)