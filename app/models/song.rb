class Song < ActiveRecord::Base
   belongs_to :artist
   belongs_to :genre
   has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end  

  def note_contents=(notes)
    notes.each do |note|
      self.notes.build(content: note) unless note.blank?
    end
  end  

  def note_contents
    self.notes ? self.notes.content : nil
  end

end
