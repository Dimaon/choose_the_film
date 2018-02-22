class FilmCollection
  def initialize(all_films)
    @all_films = all_films
  end

  def directors
    directors = @all_films.map{|i| i.director}
    return directors
  end

  def search_films_by_director(your_director)
    films_by_director = @all_films.map do |film_by_director|
      film_by_director if film_by_director.get_info_from_file.include?(your_director)
    end
    return films_by_director.compact
  end
end
