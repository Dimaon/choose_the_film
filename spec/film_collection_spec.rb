require "rspec"
require_relative "../lib/film_collection.rb"
require_relative "../lib/film.rb"

describe FilmCollection do
  dir_path = __dir__ + "/fixtures/*.txt"
  film_collection = FilmCollection.new(dir_path)
  it 'must return a array when initialize FilmCollection' do
    expect(film_collection.is_a?).to be_truthy
  end
  it 'must return an array of all directors' do
    expect(film_collection.directors).to eq ["ИмяРежжисера", "ИмяРежжисера2", "ИмяРежжисера1"]
  end

  it 'must return an array of objects of all films by director' do
    expect(film_collection.search_films_by_director("ИмяРежжисера")).to be_truthy
  end
end