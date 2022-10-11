class Game < Item
    def initialize(publish_date, multiplayer, last_played_at)
        super(publish_date)
        @multiplayer = multiplayer
        @last_played_at = last_played_at
    end

    private
    
    def can_be_archived
    end
end


# Create a Game class in a separate .rb file.
# All Game class properties visible in the diagram should be defined and set up in the constructor method.