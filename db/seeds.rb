# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Note.destroy_all

5.times do |i|
  Note.create!(
    title: "Sample Note #{i + 1}",
    body: "This is a sample note for the Hotwire Native app project.",
    pinned: i.even?
  )
end

User.find_or_create_by!(email: "demo@example.com") do |user|
  user.password = "password"
end
