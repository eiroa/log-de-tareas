class Task
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :estimatedTime, Integer
  property :elapsedTime, Integer
  property :pending, Boolean
  belongs_to :task_template
  belongs_to :account
  
  def self.create(task_templateP, accountP)
    instance = self.new()
    instance.pending = true
    instance.task_template = task_templateP
    instance.account = accountP
    instance.save
    instance
  end  
  
  def name
    TaskTemplate.find_by_id(self.task_template.id).name
  end
  
  def group_name
    TaskTemplate.find_by_id(self.task_template.id).group.name
  end
  
  def get_description()
    TaskTemplate.find_by_id(self.task_template.id).description
  end
   
  def self.validate_time(minutes)
    limit = 10000
    
    if minutes.nil?  ||  minutes == 0
      raise InvalidTimeError.new("El tiempo ingresado no puede ser vacio")
    elsif !minutes.is_a?(Integer)
       raise InvalidTimeError.new("El tiempo ingresado debe ser un numero entero")
    elsif minutes < 0
       raise InvalidTimeError.new("El tiempo ingresado no puede ser negativo")
  # Uncomment this for setting a limit
  #  elsif minutes <= limit
  #     raise InvalidTimeError.new("El tiempo ingresado es desproporcionado, ingrese un tiempo menor a #{limit}")
    end 
    
  end
  
 

end


################
### Time exception set here
###############

class InvalidTimeError < Exception
  def initialize(desc)
    super(desc)
  end
end
