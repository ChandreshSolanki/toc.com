class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :encrypted_password
      t.boolean :gender
      t.text :address
      t.integer :date_of_birth
      t.string :language
      t.string :contact
      t.string :religion
      t.string :hobby

      t.timestamps
    end
  end
end
