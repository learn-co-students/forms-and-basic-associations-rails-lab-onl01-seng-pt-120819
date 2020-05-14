class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.try(:name)
  end 

 def note_content=(notes)
  notes.each do |note|
    self.notes << Note.create(content: note)
  end
 end

 def note_content
  self.notes.collect do |note|
    note.content
  end
 end

end
