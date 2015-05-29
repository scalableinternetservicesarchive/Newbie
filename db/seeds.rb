# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

User.delete_all
Post.delete_all
Comment.delete_all
FavoritePost.delete_all
Vote.delete_all

number_of_users = 10
number_of_posts_per_user = 10
number_of_comments_per_post = 10
number_of_upvotes_per_post = 20
number_of_downvotes_per_post = 10
number_of_favorite_per_post = 10
userArray = Array.new

number_of_users.times do |n|
    u = User.create!(email: "test"+n.to_s+"@test.com", password: "00000000", user_name: Faker::Name.name, gender: "Female", birthday: DateTime.parse('2015-04-18 20:27:05'), location: "Weyburn Terrace 785, Apt 072")
    u.avatar = File.open("/Users/TIELONG/cs219/Newbie/app/assets/images/no_avatar.png")
    u.save!
    userArray.push(u)
end


userArray.each do |u|
    number_of_posts_per_user.times do
        p = Post.create!(user_id: u.id,
                     title: Faker::Name.title, 
                     datetime: DateTime.parse('2015-04-18 20:27:05'), 
                     content: Faker::Lorem.paragraph, 
                     created_at: DateTime.parse('2015-04-18 20:27:05'),
                     latitude: '34.0637725',
                     longitude: '-118.4515723',
                     image_file_name: 'default.png',
                     image_content_type: 'image/jpeg',
                     image_file_size: 81973,
                     image_updated_at: DateTime.parse('2015-04-18 20:27:05'),
                     ip_address: Faker::Internet.ip_v4_address,
                     downvote_number: number_of_downvotes_per_post,
                     upvote_number: number_of_upvotes_per_post)

        number_of_comments_per_post.times do
            Comment.create!(post_id: p.id,
                            user_id: userArray.sample.id,
                            content: Faker::Lorem.paragraph,
                            datetime: DateTime.parse('2015-04-18 20:27:05'),
                            created_at: DateTime.parse('2015-04-18 20:27:05'),
                            read: true)
        end
        number_of_downvotes_per_post.times do
            Vote.create!(post_id: p.id,
                         user_id: userArray.sample.id,
                         label: false,
                         created_at: DateTime.parse('2015-05-18 20:27:05'),
                         updated_at: DateTime.parse('2015-05-18 20:27:05'))
        end
        number_of_upvotes_per_post.times do
            Vote.create!(post_id: p.id,
                         user_id: userArray.sample.id,
                         label: true,
                         created_at: DateTime.parse('2015-05-18 20:27:05'),
                         updated_at: DateTime.parse('2015-05-18 20:27:05'))
        end
        number_of_favorite_per_post.times do
            FavoritePost.create!(post_id: p.id,
                                 user_id: userArray.sample.id,
                                 created_at: DateTime.parse('2015-04-18 20:27:05'),
                                 updated_at: DateTime.parse('2015-04-18 20:27:05'))
        end
    end
end