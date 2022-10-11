class Author
  def initialize(first_name, last_name)
    @id = Random.rand(1...1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item unless items.include?(item)
    items.genre = self
  end
end

# Create an Author class with an association to the Item class (in a separate .rb file).
# All Author class properties visible in the diagram should be defined and set up in the constructor method.
