class Task
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :estimatedTime, Integer
  property :elapsedTime, Integer
  belongs_to :task_template
  belongs_to :account
  
  def initialize(task_templateP, accountP)
    self.estimatedTime = 0
    self.elapsedTime = 0
    self.task_template = task_templateP
    self.account = accountP
    self.save
    self
  end  
  
  
  def get_description()
    TaskTemplate.find_by_id(self.task_template.id).description
  end

end
