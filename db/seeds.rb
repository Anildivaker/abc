# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Article.create(title: "first title", body: "description")
Article.create(title: "second title", body: "description")

Flag.create!([
    {
        "name": "feature_a",
        "is_active": true
    },
    {
        "name": "feature_b",
        "is_active": true
    },
    {
        "name": "feature_c",
        "is_active": true    }
])

College.create(name::"allenhouse")
College.create(name::"busuiness school")