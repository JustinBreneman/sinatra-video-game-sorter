class CreateUserPlatform < ActiveRecord::Migration[6.0]
    def change
        create_table :userplatforms do |t|
            t.integer :platform_id
            t.integer :user_id
        end
    end
end
