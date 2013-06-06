require 'spec_helper'

describe Task do

  
  it 'a task return their description' do
    task_template = BuilderTaskTemplate.new().with_description('a_crazy_description').build()
    task = BuilderTask.new().whit_task_template(task_template).build()
    task.get_description.should eq 'a_crazy_description'
  end
  
  
end
