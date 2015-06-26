# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# must be taken care of at the time of production.

   user = User.create({ username: 'Admin1' , first_name: 'Adam', last_name: 'Wilkins', login_approval: 'Yes',
		   password: 'admin1', password_confirmation: 'admin1', email: 'saumyagurtu@gmail.com'})
   User.find(user.id).add_role :admin

   user = User.create({ username: 'Admin2' , first_name: 'Neil', last_name: 'Bohr', login_approval: 'Yes',
		   password: 'admin2', password_confirmation: 'admin2', email: 'saumya.gurtu@students.iiit.ac.in'})
   User.find(user.id).add_role :admin

   Installation.create({installation: "Chuukese Post", email: "hello@hello.world", address: "helloworld, helloworld", contact: "0123456789"})
   Site.create({installation_id: 1, name: "Site A"})
   Language.create({name: "Chuukese"})