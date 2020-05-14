class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

 def artist_name=(name)
  self.artist = Artist.find_or_create_by(name: name)
 end

 def artist_name
  self.artist ? self.artist.name : nil
 end

 def note_info=(notes)
  notes.each do |note|
    if !note.empty?
      self.notes.build(content: note)
    end 
  end 
end 

def note_info
  self.notes.map(&:content)
end 
end
