user = User.create(username: "kam3r0nz", password: "password2!")

user2 = User.create(username: "iluvCatz", password: "crazyCatlady1.")

movie = Movie.create(title: "Scary Movie", genre: "Comedy", release_year: 2004, director: "Keenen Ivory Wayans", description: "A year after disposing of the body of a man they accidentally killed, a group of dumb teenagers are stalked by a bumbling serial killer.")

movie2 = Movie.create(title: "Requiem for a Dream", genre: "Drama", release_year: 2000, director: "Darren Aronofsky", description: "The drug-induced utopias of four Coney Island people are shattered when their addictions run deep.")

review1 = Review.create(name: "Kameron", date: "10/28/2020", rating: 4, content: "This was an excellent movie and I would definitely watch again!")

review2 = Review.create(name: "Bobby", date: "06/02/1993", rating: 1, content: "Would not recommend...")