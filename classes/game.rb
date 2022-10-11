require_relative './item'

class Game < Item
  attr_reader :name, :multiplayer, :publish_date, :last_played_at

  def initialize(name, publish_date, multiplayer, last_played_at)
    super(string_to_date(publish_date))
    @name = name
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && (Time.now.year - string_to_date(last_played_at).year) > 2
  end

  private

  def string_to_date(date_string)
    d = date_string.split('/')
    date = Date.new(d[0].to_i, d[1].to_i, d[2].to_i)
  end
end
