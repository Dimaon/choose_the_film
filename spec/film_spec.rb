require "rspec"
require_relative "../lib/film.rb"

describe Film do
  film = Film.new(__dir__ + "/fixtures/test_film_file.txt")
  it 'must initialize film file from directory' do
    expect(film.nil?).to be_falsey
  end

  it 'must return correct lines from file' do
    expect(film.title).to eq "ИмяФильма"
    expect(film.director).to eq "ИмяРежжисера"
    expect(film.year).to eq "1994"
  end
  it 'must return correct value from to_s method' do
    expect(film.to_s).to eq "ИмяРежжисера - ИмяФильма (1994)"
  end
end

