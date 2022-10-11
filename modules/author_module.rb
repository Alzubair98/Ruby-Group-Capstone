require_relative './music_album_module'

module AuthorModule
  include MusicAlbumModule

  def add_author_details
    puts "\n-------------------------------"
    puts "\nENTER AUTHOR DETAILS\n\n"

    first_name = capture_input('Enter First Name: ')
    last_name = capture_input('Enter Last Name: ')
    
    @app.add_author(first_name, last_name)
    puts "\nNew Author Added!"
    puts "\n-------------------------------"
  end
end
