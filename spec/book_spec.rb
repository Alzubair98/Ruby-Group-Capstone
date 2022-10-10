require_relative '../classes/book'

describe Book do
  context 'create new book object from book class' do
    book = Book.new('publisher1', 'new')

    it 'Create book' do
      publisher = book.publisher
      cover = book.cover_state
      expect(publisher).to eq('publisher1')
      expect(cover).to eq('new')
    end

    it 'check can_be_archived method' do
      archive = book.can_be_archived?
      expect(archive).to be false
    end
  end
end
