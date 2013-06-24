require 'spec_helper'

describe Task do

  describe 'return description' do
    it 'a task return their description' do
      #task interactua con la base de datos para obtener la descripcion.
      Group.destroy
      TaskTemplate.destroy    
      task_template = BuilderTaskTemplate.new().with_description('a_crazy_description').build()
      task = Task.create(task_template, nil)
      task.get_description.should eq 'a_crazy_description'
    end
  
  end
  
  describe 'update_time' do
    before(:each) do
        @task = Task.new
        @account = Account.new
        Task.should_receive(:update_time).with(@account).and_return('La estimacion ha sido ingresada correctamente')
      end
      
    it 'should return La estimacion ha sido ingresada correctamente' do
      
    end
    
  end
  
  describe 'validate_time' do
    before(:each) do
        @task = Task.new
        @account = Account.new
        Task.should_receive(:update_time).with(@account).and_return('La estimacion ha sido ingresada correctamente')
      end
      
      it'should '
    
  end
end
