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
  
  def self.update_time(task_id, account_id, minutes, hours)
        task = Task.find_by_id_and_account_id(task_id.to_i , account_id.to_i)      
        time = minutes.to_i * 60 + hours.to_i
           
        Task.validate_time(time)
             
        if task.estimatedTime.nil?
          task.estimatedTime = time
        elsif task.elapsedTime.nil?
          task.elapsedTime = time
          task.pending = false
        end
        
        task.save
  end
   
  def self.validate_time(minutes)
    raise EmptyTimeError if (minutes.nil?  ||  minutes == 0)
    raise NotAnIntegerTimeError if !minutes.is_a?(Integer)
    raise NegativeTimeError if minutes < 0
  end
end



