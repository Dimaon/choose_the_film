class FilmCollection
  def initialize(directory_path)
    get_films_from_directory(directory_path)
  end

  def get_films_from_directory(directory_path)
    film_files = Dir.glob(directory_path)
    if film_files.empty?
      abort "Файлов с фильмами не найдено"
    end
    @all_films = film_files.map{ |film_file| Film.new(film_file) }
  end

  def directors
    directors = @all_films.map{ |i| i.director }
  end

  def search_films_by_director(your_director)
    films_by_director = @all_films.map do |film_by_director|
      film_by_director if film_by_director.get_info_from_file.include?(your_director)
    end
    return films_by_director.compact
  end
end
