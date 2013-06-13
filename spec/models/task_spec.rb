require 'spec_helper'

describe Task do

  
  it 'a task return their description' do
    #task interactua con la base de datos para obtener la descripcion.
    Group.destroy
    TaskTemplate.destroy    
    task_template = BuilderTaskTemplate.new().with_description('a_crazy_description').build()
    task = Task.create(task_template, nil)
    task.get_description.should eq 'a_crazy_description'
  end
  
  
end
