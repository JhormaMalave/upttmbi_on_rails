# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


roles = ['Super admin', 'Personal admin', 'Department admin']

users = [
  {
    email: 'admin.p@upttmbi.com',
    password: 123456 
  }
]

user_roles = [
  {
    user_id: 1,
    role_id: 2
  }
]

id_types = ['V', 'P']


users.each do |user|
  new_user = User.new(user)
  new_user.save
end

user_roles.each do |user_role|
  
  UserRole.find_or_create_by(user_role)
end

roles.each do |role|
  Role.find_or_create_by(name: role)
end

