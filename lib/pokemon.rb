class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(name:, type:, id:, db:)
    @name = name
    @type = type
    @id = id 
    @db = db 
  end 
  
    def self.save(name, type, database_connection)
    DB[:conn].execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, database_connection)
    pokemon = DB[:conn].execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    name = pokemon[1]
    type = pokemon[2]

    pokemon_inst = Pokemon.new(id: id, name: name, type: type, db: DB)
  end
end 
