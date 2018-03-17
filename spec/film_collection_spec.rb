require_relative "../lib/film.rb"
require_relative "../lib/film_collection.rb"

describe FilmCollection do
  before(:all) do
    dir_path = __dir__ + "/fixtures/*.txt"
    @film_collection = FilmCollection.from_dir(dir_path)
  end

  it 'must return an array of uniq directors' do
    expect(@film_collection.directors).to contain_exactly("ИмяРежиссера", "ИмяРежиссера2", "ИмяРежиссера1")
  end

  it 'must return name of director by search method' do
    expect(@film_collection.search_films_by_director("ИмяРежиссера1").sample.director).to eq "ИмяРежиссера1"
  end

  # Антитест
  it 'must return an empty array when director is wrong' do
    expect(@film_collection.search_films_by_director("ИмяРежиссера123").empty?).to be_truthy
  end
end
