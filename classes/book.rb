class Book < item
    attr_reader :publisher , :cover_state

    def initialize(publisher, cover_state)
        @publisher = publisher
        @cover_state = cover_state
    end

    def can_be_archived?
        if @cover_state == 'bad'
            true
        else
            false
        end
    end
end