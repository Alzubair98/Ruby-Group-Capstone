require './classes/author'
require './classes/game'

describe Author do
    context 'Author class tests' do
      before(:each) do
        @author = Author.new('Francis', 'Wayungi')
      end
  
      it 'should be an Author class instance' do
        expect(@author).to be_an_instance_of Author
      end
  
      it 'should return the correct first name' do
        expect(@author.first_name).to eq 'Francis'
      end
  
      it 'should return correct last name' do
        expect(@author.last_name).to eq 'Wayungi'
      end
  
      it 'items length should equal 1' do
        @game = Game.new('Call Of Duty', '12/12/2009', true, '12/10/2022')
        @author.add_item(@game)
        expect(@author.items.size).to eq 1
      end
    end
  end
  