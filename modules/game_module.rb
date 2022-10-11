require_relative './music_album_module'

module GameModule
  include MusicAlbumModule

  def add_a_game_details
    puts "\n-------------------------------"
    puts "\nENTER GAME DETAILS\n\n"
    multiplayer = false
    name = capture_input('Enter game title ')
    publish_date = capture_input('Enter publish date (dd/mm/yyyy)')
    players = capture_input('Is the game multiplayer? (Y/N)').downcase!
    last_played_at = capture_input('Enter last played date: (dd/mm/yyyy)')
    multiplayer = true if players == 'y'
    @app.add_game(name, publish_date, multiplayer, last_played_at)
    puts "\nNew Game Added!"
    puts "\n-------------------------------"
  end
end
