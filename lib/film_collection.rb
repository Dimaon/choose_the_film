class FilmCollection
  attr_reader :all_films

  def initialize(all_films)
    @all_films = all_films
  end

  def self.from_dir(dir_path)
    film_files = Dir.glob(dir_path)
    all_films = film_files.map{ |film_file| Film.from_file(film_file) }
    new(all_films)
  end

  def directors
    all_films.map(&:director).uniq
  end

  def search_films_by_director(your_director)
    films_by_director = all_films.select do |film_by_director|
      film_by_director.film.include?(your_director)
    end
    return films_by_director.compact
  end
end
