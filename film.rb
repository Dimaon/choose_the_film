class Film
  # Получаем один фильм из пути к файлу
  def initialize(film_file_path)
    @film_file_path = film_file_path
    @title = get_info_from_file[0]
    @director = get_info_from_file[1]
    @year = get_info_from_file[2]
  end

  def get_info_from_file
    @film_file = File.new(@film_file_path, "r")
    @film = @film_file.readlines.map{|i| i.chomp}
    @film_file.close
    return @film
  end

  def title
    @title
  end

  def director
    @director
  end

  def year
    @year
  end

  def full_info
    "#{@director} - #{@title} (#{@year})"
  end

end
