require_relative './music_album_module'
require_relative './author_module'

module GameModule
  include MusicAlbumModule
  include AuthorModule

  def add_a_game_details
    puts "\n-------------------------------"
    puts "\nENTER GAME DETAILS\n\n"

    name = capture_input('Enter game title ')
    publish_date = capture_input('Enter publish date (yyyy/mm/dd)')
    players = capture_input('Is the game multiplayer? (Y/N)')
    last_played_at = capture_input('Enter last played date: (yyyy/mm/dd)')

    multiplayer = players.downcase == 'y'
    puts players

    @app.add_game(name, publish_date, multiplayer, last_played_at)
    puts "\nNew Game Added!"
    puts "\n-------------------------------"

    add_author_details
  end
end
