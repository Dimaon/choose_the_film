require_relative "../lib/film.rb"

describe Film do
  let(:film) { Film.from_file(__dir__ + "/fixtures/test_film_file.txt") }

  it 'must return correct lines from file' do
    expect(film.title).to eq "ИмяФильма"
    expect(film.director).to eq "ИмяРежиссера"
    expect(film.year).to eq "1994"
  end

  it 'must return correct value from to_s method' do
    expect(film.to_s).to eq "ИмяРежиссера - ИмяФильма (1994)"
  end
end
