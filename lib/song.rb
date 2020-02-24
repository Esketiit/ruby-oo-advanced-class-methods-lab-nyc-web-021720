class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = "", artist_name = "")
    @name = name
    @artist_name = artist_name
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new(name)
  end

  def self.create_by_name(name)
    song = Song.new(name)
    Song.all << song
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name)
      Song.find_by_name(name)
    else
      Song.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort {|song1,song2| song1.name <=> song2.name}
  end

  def self.new_from_filename(file_name)
    file_data = file_name.split(/ - |.mp3/)
    Song.new(file_data[1], file_data[0])
  end

  def self.create_from_filename(file_name)
    song = Song.new_from_filename(file_name)
    @@all << song
  end

  def self.destroy_all
    @@all = []
  end
  
end
