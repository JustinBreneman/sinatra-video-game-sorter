class CreateGameusers < ActiveRecord::Migration[6.0]
    def change
        create_table :gameusers do |t|
            t.integer :user_id
            t.integer :game_id
        end
    end
end
