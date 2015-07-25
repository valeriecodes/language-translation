# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# must be taken care of at the time of production.

    organizations = Organization.create([
        { name: "Peace Corps"},
        { name: "Red Cross"},
        { name: "Habitat for Humanity"},
        { name: "Amnesty International"}
    ])

    users = User.create!([
        { organization: organizations.first, username: 'admin1' , first_name: 'Adam', last_name: 'Wilkins',
        login_approval_at: Time.now, password: 'admin1', password_confirmation: 'admin1', email: 'saumyagurtu@gmail.com'},
        { organization: organizations.second, username: 'admin2' , first_name: 'Neil', last_name: 'Bohr',
        login_approval_at: Time.now, password: 'admin2', password_confirmation: 'admin2', email: 'ad@min.two'},
        { organization: organizations.fourth, username: 'superadmin', first_name: 'Super', last_name: 'Admin',
        login_approval_at: Time.now, password: 'superadmin', password_confirmation: 'superadmin', email: 'super@ad.min'},
        { organization: organizations.third, username: 'volunteer', first_name: 'Vol', last_name: 'Unteer',
        login_approval_at: Time.now, password: 'volunteer', password_confirmation: 'volunteer', email: 'vol@un.teer'},
        { organization: organizations.first, username: 'contributor', first_name: 'Con', last_name: 'Tributor',
        login_approval_at: Time.now, password: 'contributor', password_confirmation: 'contributor', email: 'con@tri.butor'}
    ])

    installations = Installation.create([
        { organization: organizations.first, installation: "Kenya", email: "a@a.a", address: "Kenya", contact: "0123456789"},
        { organization: organizations.second, installation: "Micronesia", email: "b@b.b", address: "Micronesia", contact: "1234567890"},
        { organization: organizations.third, installation: "Haiti", email: "c@c.c", address: "Haiti", contact: "2345678901"},
        { organization: organizations.fourth, installation: "Philippines", email: "d@d.d", address: "Philippines", contact: "3456789012"},
        { organization: organizations.first, installation: "Nepal", email: "e@e.e", address: "Nepal", contact: "4567890123"}
    ])

    sites = Site.create([
        { installation: installations.first, name: "Nairobi"},
        { installation: installations.first, name: "Mombasa"},
        { installation: installations.second, name: "Caroline Islands"},
        { installation: installations.second, name: "Gilbert Islands"},
        { installation: installations.third, name: "Port-au-Prince"},
        { installation: installations.third, name: "Les Cayes"},
        { installation: installations.fourth, name: "Manilla"},
        { installation: installations.fourth, name: "Caloocan"},
        { installation: installations.fifth, name: "Kathmandu"},
        { installation: installations.fifth, name: "Pokhara"}
    ])

    categories = Category.create([
        {name: "Animals"},
        {name: "Vehicles"},
        {name: "Insects"},
        {name: "Astronomy"},
        {name: "Adjectives"},
        {name: "Shapes"},
        {name: "Food"},
        {name: "Landscape"},
        {name: "Tools"}
    ])

    languages = Language.create([
        {name: "Chuukese"},
        {name: "Swahili"},
        {name: "Pohnpeian"}
    ])

    User.find_by_username('admin1').add_role :admin
    User.find_by_username('admin2').add_role :admin
    User.find_by_username('superadmin').add_role :superadmin
    User.find_by_username('volunteer').add_role :volunteer, sites.fifth
    User.find_by_username('contributor').add_role :contributor, sites.first



