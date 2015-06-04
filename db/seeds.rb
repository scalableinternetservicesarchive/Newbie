# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

number_of_users = 1000
number_of_tags = 100
number_of_posts_per_user = 10
number_of_comments_per_post = 10
number_of_upvotes_per_post = 20
number_of_downvotes_per_post = 10
number_of_favorite_per_post = 10
number_of_tags_per_post = 3
userArray = Array.new
tagArray = Array.new

number_of_users.times do |n|
    u = User.create!(email: "test"+n.to_s+"@test.com", password: "00000000", user_name: Faker::Name.name, gender: "Female", birthday: DateTime.parse('2015-04-18 20:27:05'), location: "Weyburn Terrace 785, Apt 072")
    file = File.open("app/assets/images/Angela_Baby.jpg")
    u.avatar = file
    u.save!
    userArray.push(u)
    file.close
end

number_of_tags.times do |t|
    t = Tag.create!(name: Faker::Name.name)
    tagArray.push(t)
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
                     image_file_name: '4.jpg',
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

        number_of_tags_per_post.times do
            sample_tag = tagArray.sample
            ActiveRecord::Base.connection.execute("INSERT INTO `taggings` (`tag_id`, `context`, `taggable_id`, `taggable_type`, `created_at`) VALUES (" + sample_tag.id.to_s + ", 'tags', " + p.id.to_s + ", 'Post', '2015-06-03 04:46:23')")
            tag = Tag.find_by_name(sample_tag.name)
            tag.update_attributes!(taggings_count: tag.taggings_count+1)
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
                         user_id: Faker::Number.number(9),
                         label: true,
                         created_at: DateTime.parse('2015-05-18 20:27:05'),
                         updated_at: DateTime.parse('2015-05-18 20:27:05'))
        end
        number_of_favorite_per_post.times do
            FavoritePost.create!(post_id: p.id,
                                 user_id: Faker::Number.number(9),
                                 created_at: DateTime.parse('2015-04-18 20:27:05'),
                                 updated_at: DateTime.parse('2015-04-18 20:27:05'))
        end
    end
end
