require_relative '../classes/label.rb'

describe Label do
    context 'check label class' do
        it 'create new label' do
            label = Label.new('book1', 'red')
            expect(label.color).to eq('red') 
            expect(label.title).to eq('book1')
        end
    end
end