require './classes/book.rb'
require 'json'

if File.exist?('./classes/books.json')
  $books = if File.zero?('./classes/books.json')
             []
           else
             JSON.parse(File.read('./classes/books.json'))
           end
else
  puts 'There is no books file.'
end

def add_book
  puts 'please enter the details below'
  puts 'Enter Publisher name:- '
  publisher_name = gets.chomp
  puts 'Enter Cover state (good/bad)'
  cover = gets.chomp
  $books << Book.new(publisher_name, cover)
  puts 'Book created :)'
end

def add_book_to_file
  books_list = []
  $books.each do |book|
    books_list << if book.instance_of?(Hash)
                    book
                  else
                    { publisher: book.publisher, cover_state: book.cover_state }
                  end
    File.write('./classes/books.json', JSON.pretty_generate(books_list))
  end
end

def list_books
  if $books.empty?
    puts 'there is no books :('
  else
    $books.each { |book| book.each { |k, v| puts "#{k}:- #{v}"}}
  end
end
