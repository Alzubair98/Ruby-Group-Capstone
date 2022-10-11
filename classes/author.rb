class Author
  attr_reader :first_name, :last_name, :id
  def initialize(first_name, last_name)
    @id = Random.rand(1...1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item unless items.include?(item)
    items.author = self
  end
end
