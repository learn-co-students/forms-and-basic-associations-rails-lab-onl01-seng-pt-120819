class Song < ActiveRecord::Base
  belongs_to :genre
  belongs_to :artist 
  has_many :notes 

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil  
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil  
  end

  def notes=(notes)  #=> overwrites writer method for notes attribute of the Song
    notes.each do |note|
      if !note.empty?
        n = Note.new(:content => note, :song_id => self.id)
        n.save 
        self.notes << n 
      end
    end
  end



end
