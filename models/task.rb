class Task
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :estimatedTime, Integer
  property :elapsedTime, Integer

end
