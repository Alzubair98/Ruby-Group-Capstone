require_relative './music_album'
require_relative './genre'
require './classes/book'
require './classes/label'
require './modules/preserver_module'
require_relative './game'
require_relative './author'

class App
  include PreserverModule
  attr_reader :books, :labels

  def initialize
    @books = []
    @labels = []
    @albums = []
    @genres = []
    @games = []
    @authors = []

    load_data
  end

  def add_book(new_book)
    new_book_instance = Book.new(*new_book)
    hash = {
      'publisher' => new_book_instance.publisher,
      'publish_date' => new_book_instance.publish_date,
      'cover_state' => new_book_instance.cover_state
    }
    @books << hash
  end

  def add_label(new_label)
    new_label_instance = Label.new(*new_label)
    hash = {
      'title' => new_label_instance.title,
      'color' => new_label_instance.color
    }
    @labels << hash
  end

  def list_all_books
    puts "\nNote: No Books available." if @books.empty?

    puts "\n---------------------------------------------"
    puts "\nALL BOOKS\n\n"
    puts "\nPublisher \t| Publish Date \t| Cover State"
    puts '-------------------------------------------------'
    @books.each do |book|
      puts "#{book['publisher']} \t\t| #{book['publish_date']} \t| #{book['cover_state']}"
      puts "\n-------------------------------------------------"
    end
  end

  def list_all_labels
    puts "\nNote: No Label available." if @labels.empty?

    puts "\n----------------------------"
    puts "\nALL LABELS\n\n"
    puts "\nLabels \t| Color"
    puts '----------------------------'
    @labels.each do |label|
      puts "#{label['title'].strip} \t| #{label['color']}"
      puts "\n----------------------------"
    end
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

    puts "\n----------------------------"
    puts "\nALL ALBUMS\n\n"
    puts "\Genre \t| On spotify? \t| Album Name \t| Publish Date"
    puts '-------------------------------------------------------'
    @albums.each do |album|
      puts "#{album['genre'].to_s.strip} \t| #{album['on_spotify?']
      .to_s.strip.rjust(10)} \t| #{album['album_name'].to_s.strip.rjust(10)} \t| #{album['publish_date']
      .to_s.strip.rjust(10)}"
      puts "\n---------------------------------------------------"
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
    save_data_as_json(@books, 'books')
    save_data_as_json(@labels, 'labels')
    save_data_as_json(@albums, 'albums')
    save_data_as_json(@genres, 'genres')
    save_data_as_json(@games, 'games')
    save_data_as_json(@authors, 'authors')
  end

  def add_game(name, publish_date, multiplayer, last_played_at)
    # new_game_instance = Game.new(name, publish_date, multiplayer, last_played_at)
    new_game_hash = {
      'name' => name,
      'publish_date' => publish_date,
      'multiplayer' => multiplayer,
      'last_played_at' => last_played_at
    }
    @games << new_game_hash
  end

  def list_of_games
    puts "\nNote: No games available." if @games.empty?
    puts "\n"
    puts "\nALL GAMES\n\n"
    puts "\Title \t| Published date \t| Is multiplayer \t| Last palyed date"
    puts '---------------------------'
    @games.each do |game|
      puts "#{game['name']} \t| #{game['publish_date']} \t| #{game['multiplayer']} \t| #{game['last_played_at']}"
      puts "\n-----------------------"
    end
  end

  def list_all_authors
    puts "\nNote: No authors available." if @authors.empty?
    puts "\n"
    puts "\nALL AUTHORS\n\n"
    puts "\First Name \t| Last Name "
    puts '---------------------------'
    @authors.each do |author|
      puts "#{author['first_name']} \t| #{author['last_name']}"
      puts "\n-----------------------"
    end
  end

  def add_author(first_name, last_name)
    author = Author.new(first_name, last_name)
    author_hash = {
      'first_name' => first_name,
      'last_name' => last_name,
      'id' => author.id
    }
    @authors << author_hash
  end

  private

  def load_data
    @books = load_file('books')
    @labels = load_file('labels')
    @albums = load_file('albums')
    @genres = load_file('genres')
    @games = load_file('games')
    @authors = load_file('authors')
  end
end
