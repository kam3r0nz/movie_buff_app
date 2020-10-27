user = User.create(username: "kam3r0nz", password: "password2!")

user2 = User.create(username: "iluvCatz", password: "crazyCatlady1.")

movie = Movie.create(title: "Scary Movie", genre: "Comedy", release_year: 2004, director: "Keenen Ivory Wayans", description: "A year after disposing of the body of a man they accidentally killed, a group of dumb teenagers are stalked by a bumbling serial killer.", user: User.find_by(username: "kam3r0nz"))

movie2 = Movie.create(title: "Requiem for a Dream", genre: "Drama", release_year: 2000, director: "Darren Aronofsky", description: "The drug-induced utopias of four Coney Island people are shattered when their addictions run deep.", user: User.find_by(username: "iluvCatz"))

movie3 = Movie.create(title: "A Nightmare on Elm Street", genre: "Horror", release_year: 1984, director: "Wes Craven", description: "The monstrous spirit of a slain child murderer seeks revenge by invading the dreams of teenagers whose parents were responsible for his untimely death.", user: User.find_by(username: "kam3r0nz"))

movie4 = Movie.create(title: "Smiley Face", genre: "Comedy", release_year: 2007, director: "Gregg Araki", description: "After a young actress unknowingly eats her roommate's marijuana cupcakes, her day becomes a series of misadventures.", user: User.find_by(username: "kam3r0nz"))

movie5 = Movie.create(title: "Poultrygeist: Night of the Chicken Dead", genre: "Comedy", release_year: 2006, director: "Lloyd Kaufman", description: "Zombified chickens attempt to kill the fast-food workers that cook them in a restaurant built on an ancient burial ground.", user: User.find_by(username: "iluvCatz"))

review1 = Review.create(user: User.find_by(username: "kam3r0nz"), date: "10/28/2020", rating: 4, comment: "This was an excellent movie and I would definitely watch again!", movie: Movie.first)

review2 = Review.create(user: User.find_by(username: "kam3r0nz"), date: "06/02/1993", rating: 1, comment: "Would not recommend...", movie: Movie.find_by(title: "Requiem for a Dream"))