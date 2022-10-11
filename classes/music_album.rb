require_relative './item'

class MusicAlbum
  def initialize(on_spotify, publish_date = Time.now)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?()
    super() and @on_spotify
  end
end
