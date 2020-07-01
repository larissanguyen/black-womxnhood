# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
a1 = Author.create(name: "James Baldwin", bio: "Author writing about black experience")
a2 = Author.create(name: "Toni Morrison", bio: "Fiction author focused on black experience")
a3 = Author.create(name: "Ava Duvernay", bio: "Black female director exploring black experience")
a4 = Author.create(name: "Lindsay Pierce", bio: "Average girl writing whatever comes to mind")

t1 = Topic.create(name: "Black Queer Experience")
t2 = Topic.create(name: "Colorism")
t3 = Topic.create(name: "Prison-industrial Complex")
t4 = Topic.create(name: "Adultification of Black Women")
t5 = Topic.create(name: "Female Directed")
t6 = Topic.create(name: "Segregation")
t7 = Topic.create(name: "Black Love")

r1 = Resource.create(title: "13th", topics: [t3, t5], author: a3, date_published: Time.now)
r2 = Resource.create(title: "The Fire Next Time", topics: [t3, t6], author: a1, date_published: Time.now)
r3 = Resource.create(title: "If Beale Street Could Talk",  topics: [t6, t7], author: a1, date_published: Time.now)
r4 = Resource.create(title: "Black Girl Therapy", topics: [t1, t2, t4, t7], author: a4, date_published: Time.now)

u1 = User.create(name: "Larissa")
u2 = User.create(name: "Jane")
u3 = User.create(name: "Bob")
u4 = User.create(name: "Justine")

c1 = Comment.create(user: u1, resource: r1, content: "awesome documentary")
c2 = Comment.create(user: u2, resource: r2, content: "incredible narration")
c3 = Comment.create(user: u2, resource: r1, content: "truly eye-opening")
c4 = Comment.create(user: u3, resource: r1, content: "love Ava Duvernay!")
c5 = Comment.create(user: u3, resource: r4, content: "wild ride! awesome content")

up1 = Upvote.create(user: u1, resource: r4)
up2 = Upvote.create(user: u2, resource: r4)
up3 = Upvote.create(user: u1, resource: r3)
up4 = Upvote.create(user: u1, resource: r1)
up5 = Upvote.create(user: u1, resource: r2)