# require 'pry'
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

  def notes=(notes)  
    notes.each do |note|
      if !note.empty?
        n = Note.new(:content => note, :song_id => self.id)
        n.save 
        self.notes << n 
      end
    end
  end

end
