migration 3, :create_tasks do
  up do
    create_table :tasks do
      column :id, Integer, :serial => true
      column :estimatedTime, Integer
      column :elapsedTime, Integer
    end
  end

  down do
    drop_table :tasks
  end
end
