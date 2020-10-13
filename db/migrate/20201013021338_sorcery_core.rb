class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.text :username,         null: false
      t.text :email,            null: false
      t.text :crypted_password, null: false
      t.text :salt,             null: false

      t.timestamps              null: false
    end

    add_index :authors, :email, unique: true
  end
end
