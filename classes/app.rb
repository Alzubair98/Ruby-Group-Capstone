require_relative './music_album'
require_relative './genre'
require './modules/preserver_module'
require_relative './game'

class App
  include PreserverModule

  def initialize
    @albums = []
    @genres = []
    @games = []
    @authors = []

    load_data
  end

  def add_album(album_name, publish_date, genre_name, on_spotify)
    new_album_instance = MusicAlbum.new(on_spotify, album_name, publish_date)
    new_genre_instance = Genre.new(genre_name)
    new_album_instance.genre = new_genre_instance

    hash = {
      'album_name' => new_album_instance.name,
      'publish_date' => new_album_instance.publish_date,
      'on_spotify?' => new_album_instance.on_spotify,
      'genre' => new_genre_instance.name
    }

    genre_hash = {
      'genre_name' => new_genre_instance.name
    }

    @albums << hash
    @genres << genre_hash
  end

  def list_all_albums
    puts "\nNote: No albums available." if @albums.empty?

    puts "\n"
    puts "\nALL ALBUMS\n\n"
    puts "\Genre \t| On spotify? \t| Album Name \t| Publish Date"
    puts '---------------------------'
    @albums.each do |album|
      puts "#{album['genre'].to_s.strip} \t| #{album['on_spotify?']
      .to_s.strip.rjust(10)} \t| #{album['album_name'].to_s.strip.rjust(10)} \t| #{album['publish_date']
      .to_s.strip.rjust(10)}"
      puts "\n-----------------------"
    end
  end

  def list_all_genres
    puts "\nNote: No genres available." if @genres.empty?

    puts "\n----------------------------"
    puts "\nALL GENRES\n\n"
    puts "\Name"
    puts '----------------------------'
    @genres.each do |genre|
      puts genre['genre_name'].to_s.strip
      puts "\n----------------------------"
    end
  end

  def preserve_files
    save_data_as_json(@albums, 'albums')
    save_data_as_json(@genres, 'genres')
  end

  def add_game(name, publish_date, multiplayer, last_played_at)
    new_game_instance = Game.new(name, publish_date, multiplayer, last_played_at)
    @games << new_game_instance
  end

  def list_of_games
    puts "\nNote: No games available." if @games.empty?
    puts "\n"
    puts "\nALL GAMES\n\n"
    puts "\Title \t| Published date \t| Is multiplayer \t| Last palyed date"
    puts '---------------------------'
    @games.each do |game|
      puts "#{game.name} \t| #{game.publish_date} \t| #{game.multiplayer} \t| #{game.last_played_at}"
      puts "\n-----------------------"
    end


  end

  private

  def load_data
    @albums = load_file('albums')
    @genres = load_file('genres')
  end
end
