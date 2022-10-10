require_relative './item'

class Book < Item
  attr_reader :publisher, :cover_state

  def initialize(publisher, cover_state)
    super(publish_date, archived: false)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    @cover_state == 'bad'
  end
end
