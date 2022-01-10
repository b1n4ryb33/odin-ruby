class Cinema
  attr_accessor :name, :location, :movies

  def initialize(name, location)
    @name = name
    @location = location
    @movies = []  
  end

  def add_movie(movie)
    @movies << movie
    movie.cinema = self  
  end

  def get_movies
    self.movies.to_s
  end

end

class Movie

  attr_accessor :title, :showtime, :cinema

  @@all = []

  def initialize (title, showtime)
    @title = title
    @showtime = showtime
    @@all << self
  end

end


cobble_hill = Cinema.new("Cobble Hill", "Court Str., Brooklyn")
spider_man = Movie.new("Spider-Man", "9:00")
spider_man_2 = Movie.new("Spider-Man-2", "9:00")
cobble_hill.add_movie(spider_man)
cobble_hill.add_movie(spider_man_2)
puts cobble_hill.get_movies