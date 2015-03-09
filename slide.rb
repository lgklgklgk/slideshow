class Slide
  attr_reader :id, :title, :body
  
  def initialize(options)
    @id = options["id"] || options[:id]
    @title = options["title"] || options[:title]
    @body = options["body"] || options[:body]
  end
  
  def self.all
    results = DATABASE.execute("SELECT * FROM slides")
    results.map { |row_hash| self.new(row_hash) }
  end
  
  def self.fetch(id)
    slide = DATABASE.execute("SELECT * FROM slides WHERE id = #{id}")
    self.new(slide)
  end
  
  def to_hash
    {
      id: id,
      title: title,
      body: body
    }
  end
end