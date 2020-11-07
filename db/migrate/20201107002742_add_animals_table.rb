class AddAnimalsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :animals do |t|
      t.column :name, :string
      t.column :age, :string
      t.column :breed, :string
    end
  end
end
