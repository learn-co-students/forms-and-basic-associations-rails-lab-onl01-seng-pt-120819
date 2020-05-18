class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist.try(:name)
  end

  def notes_content=(notes)
    notes.each{ |n| 
      self.notes.push(Note.create(content: n))
    }
  end

  def notes_content
    self.notes.map {|n|
      n.content
    }
  end

end
