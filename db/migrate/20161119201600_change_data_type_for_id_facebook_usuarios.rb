class ChangeDataTypeForIdFacebookUsuarios < ActiveRecord::Migration
  def self.up
    change_table :usuarios do |t|
      t.change :id_facebook, :integer, :limit => 8
    end
  end
  def self.down
    change_table :usuarios do |t|
      t.change :id_facebook, :integer 
    end
  end


end
