class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :email
    	t.string :password_digest
    	t.date :birthday
    	t.integer :phone_number
 		t.string :profile_picture
    	t.string :gender
    	t.string :preferred_language, :default => "English"
    	t.string :preferred_currency, :default => nil
    	t.string :address
    	t.string :describe_yourself
    	t.integer :identification

      	t.timestamps
    end
  end
end
