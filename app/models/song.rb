require 'pry'

class Song < ActiveRecord::Base
  belongs_to :artist 
  belongs_to :genre
  has_many :notes 

  accepts_nested_attributes_for :notes 

  

  def artist_name
    self.artist.name if self.artist 
  end 

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    self.save 
  end

  def genre_name
    self.genre.name if self.genre 
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def note_contents
    
    self.notes.collect(&:content)
  end

  
end
