# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Profile.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

users = [
    ["Carly Fiorina", 1954, "female"],
    ["Donald Trump", 1946, "male"],
    ["Ben Carson", 1951, "male"],
    ["Hillary Clinton", 1947, "female"]
]


users.each do |u|
    fname, lname = u[0].split[0], u[0].split[1]

    user = User.create(username: lname, password_digest: fname.downcase.reverse)
    user.profile = Profile.create(gender: u[2], birth_year: u[1], first_name: fname, last_name: lname)

    tl = user.todo_lists.create(list_name: "The #{lname} List", list_due_date: Date.today+1.year)

    5.times do |i|
        tl.todo_items.create(due_date: Date.today+1.year, title: "Item #{i+1}", description: "This is task #{i+1}", completed: false)
    end
end

