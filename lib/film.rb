class Film
  attr_reader :title, :director, :year
  # Получаем один фильм из пути к файлу
  def initialize(film_file_path)
    @film_file_path = film_file_path
    get_info_from_file
  end

  def get_info_from_file
    film_file = File.new(@film_file_path, "r")
    film = film_file.readlines.map{|i| i.chomp}
    @title = film[0]
    @director = film[1]
    @year = film[2]
    film_file.close
    return film
  end

  def to_s
    "#{@director} - #{@title} (#{@year})"
  end
end
