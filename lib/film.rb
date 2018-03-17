class Film
  attr_reader :title, :director, :year, :film

  def initialize(args)
    @title = args[:title]
    @director = args[:director]
    @year = args[:year]
    @film = args[:film]
  end

  # Получаем один фильм из пути к файлу
  def self.from_file(file_path)
    film = File.readlines(file_path).map(&:chomp)
    args = {}
    args[:title] = film[0]
    args[:director] = film[1]
    args[:year] = film[2]
    args[:film] = film
    new(args)
  end

  def to_s
    "#{director} - #{title} (#{year})"
  end
end
