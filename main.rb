require './app'

class Main
  def menu
    puts "\n"
    puts 'please choose an option by entering a number:
    1 - List all books
    2 - List all music albums
    3 - List all games
    4 - List all genres
    5 - List all labels
    6 - List all authors
    7 - Add a book
    8 - Add a music album
    9 - Add a game
    10 - Exit'
  end

  def handle_selection
    user_input = gets.chomp
    case user_input
    when '1'
      list_books
    when '2'
      puts 'all music albums'
    when '3'
      puts 'all games'
    when '4'
      puts 'all genres'
    when '5'
      list_labels
    when '6'
      puts 'all authors'
    when '7'
      add_book
    when '8'
      puts 'Add a music album'
    when '9'
      puts 'Add a game'
    when '10'
      add_book_to_file
      puts 'Thanks for using the app'
      exit
    else
      puts 'Wrong input'
    end
  end

  def run
    user_input = nil
    puts 'Welcome to the catalog of my things'

    while user_input != '10'
      menu
      handle_selection
    end
  end
end

def main
  app = Main.new
  app.run
end

main
