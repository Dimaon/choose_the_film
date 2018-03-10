require_relative "lib/film.rb"
require_relative "lib/film_collection.rb"

# Получаем массив из путей к файлам
directory_path = "./data/*.txt"

film_collection = FilmCollection.new(directory_path)

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
your_director = directors.uniq[your_choice-1]

# Получаем обьект фильма на основе польз. ввода из всех фильмов по имени режжисера
films_by_director = film_collection.search_films_by_director(your_director)

# Получаем произвольный обьект найденного фильма по имени режжисера
sample_film_by_director = films_by_director.sample

puts "И сегодня вечером рекомендую посмотреть:"
# Получить отформатированную строку: Режиссер - Фильм (год выхода)
puts sample_film_by_director
