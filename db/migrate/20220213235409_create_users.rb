class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, unique: true
      t.string :avataara_img
      t.boolean :admin, null: false, default: false
      t.string :password_digest, null: false
      t.timestamps
    end
  end
end
