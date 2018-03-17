require_relative "lib/film.rb"
require_relative "lib/film_collection.rb"

# Получаем массив из путей к файлам
dir_path = "./data/*.txt"

if Dir.glob(dir_path).empty?
  puts "Файлов с фильмами не найдено"
  exit
end

film_collection = FilmCollection.from_dir(dir_path)

# Получаем массив имен режиссеров
directors = film_collection.directors

puts "Фильм какого режиссера вы хотите сегодня посмотреть?"
# Вывести список уникальных режиcсеров
num_director = 0
puts directors.uniq.map{|i| "#{num_director += 1}. #{i}"}

# Получаем от пользователя номер режиссера
your_choice = STDIN.gets.to_i
while your_choice > directors.uniq.size ||
      your_choice < 1  do
  puts "Введите верное число"
  your_choice = STDIN.gets.to_i
end

# Получаем имя режиссера из массива на основе пользовательского ввода
your_director = directors[your_choice-1]

# "Получаем массив обьектов фильмов на основе польз. ввода из всех фильмов по имени режжисера"
p films_by_director = film_collection.search_films_by_director(your_director)

# Получаем произвольный обьект найденного фильма по имени режжисера
sample_film_by_director = films_by_director.sample

puts "И сегодня вечером рекомендую посмотреть:"
# Получить отформатированную строку: Режиссер - Фильм (год выхода)
puts sample_film_by_director
