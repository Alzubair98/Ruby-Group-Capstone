require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, label)
    super(publish_date, label, archived: false)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    @cover_state == 'bad'
  end
end
