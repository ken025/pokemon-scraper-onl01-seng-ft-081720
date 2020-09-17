class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(name:, type:, id:, db:)
    @name = name
    @type = type
    @id = id 
    @db = db 
  end 
  
  def self.save
    sql = "INSERT INTO songs (name, album)
    VALUES(?,?)"
    
   DB[:conn].execute(sql, self.name, self.type, self.db, self.id)
   @id = DB[:conn].execute("SELECT las_insert_rowid() FROM pokemons")[0][0]
 end 
end
