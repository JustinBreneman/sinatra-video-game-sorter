class CreateGames < ActiveRecord::Migration[6.0]
    def change
        create_table :games do |t|
            t.string :title
            t.string :developer
            t.string :release_date
            t.integer :platform_id
        end
    end
end
