class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :fax
      t.string :type
      t.string :phone
      t.string :location
      t.string :website
      t.string :email
      t.string :publish_email
      t.string :keywords
      t.string :publish_to
      t.string :ownership
      

      t.timestamps null: false
    end
    add_index :services, :phone, :unique => true
  end
end
