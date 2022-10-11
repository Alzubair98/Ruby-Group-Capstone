class Game < Item
    attr_reader :name, :multiplayer, :publish_date, :last_played_at
  def initialize(name, publish_date, multiplayer, last_played_at)
    super(publish_date)
    @name = name
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived
    super && (Time.now.year - last_played_at) > 2
  end
end
