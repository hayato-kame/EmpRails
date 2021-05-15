# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Department.create([
  {department_id: 'D01', department_name: '総務部'},
  {department_id: 'D02', department_name: '営業部'},
  {department_id: 'D03', department_name: '経理部'},
])
