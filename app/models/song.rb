class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes
  

  # Artist
  def artist_name=(name)
     self.artist = Artist.find_or_create_by(name: name)
   end
 
   def artist_name
      self.artist ? self.artist.name : nil
   end
  

  # Genre
  def genre_id=(id)
     self.genre = Genre.find_by(id: id)
   end
 
   def genre_id
      self.genre ? self.genre.id : nil
   end

   #Notes
  #  accepts_nested_attributes_for :notes

    # Below goes into Form_for
    #   <%= f.fields_for :notes, @songs.notes do |n|%>
    #   <%= n.text_field :content %>
    # <% end %>

   def notes_attributes=(notes)
      notes.each do |note|
        song_note = self.notes.build(content: note)
        song_note.save
      end
   end
   def notes_attributes
    self.notes.collect{|n| n.content}
   end

end
