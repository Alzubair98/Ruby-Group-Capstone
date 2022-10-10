class Item
    attr_reader :genre, :author, :source ,:label
    def initialize(publish_date, archived:false)
        @id = Random.rand(1..1000)
        @genre = genre
        @author = author
        @source = source
        @label = label
        @publish_date = publish_date
        @archived = archived
    end

    def can_be_archived?
        (Time.now.year - publish_date.year) > 10 
    end

    def move_to_archive
        @archived = can_be_archived?
    end


end