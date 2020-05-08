class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :genre
  belongs_to :artist

  def artist_name= (name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id= (id)
    self.genre = Genre.find_or_create_by(id: id)
  end

  def genre_id
    self.genre ? self.genre.id : nil
  end

  def song_notes=(notes)
    notes.each do |note|
      self.notes.build(content: note)
    end
  end

  # def note_contents
  #   content = []
  #   self.notes.each do |note|
  #     content << note.content
  #   end
  #   content
  # end
end
