require 'date'
require './classes/game'

describe Game do
    context 'Game class tests' do
      before(:each) do
        @game = Game.new('COD', '2022/12/20', true, '2022/10/12')
      end
  
      it 'should be a Game class instance' do
        expect(@game).to be_an_instance_of Game
      end
  
      it 'should return the correct game name' do
        expect(@game.name).to eq 'COD'
      end
  
      it 'should return correct multiplayer status' do
        expect(@game.multiplayer).to eq true
      end
  
      it 'items should return correct value for can be archived ' do
        expect(@game.can_be_archived?).to eq false
      end
    end
  end
  