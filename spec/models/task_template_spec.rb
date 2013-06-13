require 'spec_helper'

describe TaskTemplate do
  
  describe 'constructor' do
  
    it 'should assaign group to the created task' do
      Group.should_receive(:find_by_name).and_return(nil)
      group = BuilderGroup.new().with_name('un_grupo').build()
      task1 = TaskTemplate.create('name', 'description', group)
      task1.group.should eq group
    end
    
    it 'should raise ErrorsException if blank name' do
      Group.should_receive(:find_by_name).and_return(nil)
      group = BuilderGroup.new().with_name('un_grupo').build()
      begin
        TaskTemplate.create('a_name', '', group)
        fail        
      rescue ErrorsException => e
        e.errors.should have(1).items
      end
    end
    
    it 'should raise ErrorsException if blank description' do
      Group.should_receive(:find_by_name).and_return(nil)
      group = BuilderGroup.new().with_name('un_grupo').build()
      begin
        TaskTemplate.create('', 'description', group)
        fail        
      rescue ErrorsException => e
        e.errors.should have(1).items
      end
    end
    
  end
  
  
  
  describe 'check_name' do
    it 'should not add error if unique' do
      name = 'name'
      Group.should_receive(:find_by_name).and_return(nil)
      group = BuilderGroup.new().build()
      TaskTemplate.should_receive(:find_by_name_and_group).with(name, group).and_return(nil)
      errors = []
      TaskTemplate.check_name(errors, name , group)
      errors.should be_empty
    end
  end
  
    
  
end
