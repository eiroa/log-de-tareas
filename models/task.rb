class Task
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :estimatedTime, Integer
  property :elapsedTime, Integer
  belongs_to :task_template
  belongs_to :account
  
  def self.create(task_templateP, accountP)
    instance = self.new()
    instance.estimatedTime = 0
    instance.elapsedTime = 0
    instance.task_template = task_templateP
    instance.account = accountP
    instance.save
    instance
  end  
  
  
  def get_description()
    TaskTemplate.find_by_id(self.task_template.id).description
  end

end
