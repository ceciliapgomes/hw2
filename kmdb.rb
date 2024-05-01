# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
Role.destroy_all
Movie.destroy_all
Studio.destroy_all
Actor.destroy_all

# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
studios = [
  { name: "Warner Bros." }
]

studios.each do |studio|
  Studio.create!(studio)
end

warner_bros = Studio.find_by(name: "Warner Bros.")

movies = [
  { title: "Batman Begins", year: 2005, rating: "PG-13", studio: warner_bros },
  { title: "The Dark Knight", year: 2008, rating: "PG-13", studio: warner_bros },
  { title: "The Dark Knight Rises", year: 2012, rating: "PG-13", studio: warner_bros }
]

movies.each do |movie|
  Movie.create!(movie)
end

actors = [
  { name: "Christian Bale" },
  { name: "Michael Caine" },
  { name: "Liam Neeson" },
  { name: "Katie Holmes" },
  { name: "Gary Oldman" },
  { name: "Heath Ledger" },
  { name: "Aaron Eckhart" },
  { name: "Maggie Gyllenhaal" },
  { name: "Tom Hardy" },
  { name: "Joseph Gordon-Levitt" },
  { name: "Anne Hathaway" }
]

actors.each do |actor|
  Actor.create!(actor)
end

roles = [
  { movie: Movie.find_by(title: "Batman Begins"), actor: Actor.find_by(name: "Christian Bale"), character_name: "Bruce Wayne" },
  { movie: Movie.find_by(title: "Batman Begins"), actor: Actor.find_by(name: "Michael Caine"), character_name: "Alfred" },
  { movie: Movie.find_by(title: "Batman Begins"), actor: Actor.find_by(name: "Liam Neeson"), character_name: "Ra's Al Ghul" },
  { movie: Movie.find_by(title: "Batman Begins"), actor: Actor.find_by(name: "Katie Holmes"), character_name: "Rachel Dawes" },
  { movie: Movie.find_by(title: "Batman Begins"), actor: Actor.find_by(name: "Gary Oldman"), character_name: "Commissioner Gordon" },
  { movie: Movie.find_by(title: "The Dark Knight"), actor: Actor.find_by(name: "Christian Bale"), character_name: "Bruce Wayne" },
  { movie: Movie.find_by(title: "The Dark Knight"), actor: Actor.find_by(name: "Heath Ledger"), character_name: "Joker" },
  { movie: Movie.find_by(title: "The Dark Knight"), actor: Actor.find_by(name: "Aaron Eckhart"), character_name: "Harvey Dent" },
  { movie: Movie.find_by(title: "The Dark Knight"), actor: Actor.find_by(name: "Michael Caine"), character_name: "Alfred" },
  { movie: Movie.find_by(title: "The Dark Knight"), actor: Actor.find_by(name: "Maggie Gyllenhaal"), character_name: "Rachel Dawes" },
  { movie: Movie.find_by(title: "The Dark Knight Rises"), actor: Actor.find_by(name: "Christian Bale"), character_name: "Bruce Wayne" },
  { movie: Movie.find_by(title: "The Dark Knight Rises"), actor: Actor.find_by(name: "Gary Oldman"), character_name: "Commissioner Gordon" },
  { movie: Movie.find_by(title: "The Dark Knight Rises"), actor: Actor.find_by(name: "Tom Hardy"), character_name: "Bane" },
  { movie: Movie.find_by(title: "The Dark Knight Rises"), actor: Actor.find_by(name: "Joseph Gordon-Levitt"), character_name: "John Blake" },
  { movie: Movie.find_by(title: "The Dark Knight Rises"), actor: Actor.find_by(name: "Anne Hathaway"), character_name: "Selina Kyle" }
]

roles.each do |role|
  Role.create!(role)
end

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
movies = Movie.all
movies.each do |movie|
  studio = Studio.find(movie.studio_id)
  puts "#{movie.title.ljust(25)} #{movie.year.to_s.rjust(4)} #{movie.rating.ljust(5)} #{studio.name}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
