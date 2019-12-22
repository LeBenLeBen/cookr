class AddUsernameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string

    User.all.each do |u|
      unless u.username.present?
        u.username = "user-#{rand(10_000...99_999)}"
        u.save
      end
    end
  end
end
