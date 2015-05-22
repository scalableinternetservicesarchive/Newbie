# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
100.times do |i|
	User.create!(id: i, email: "test"+i.to_s+"@test.com", password: "00000000", user_name: "test"+i.to_s, gender: "Female", birthday: DateTime.parse('2015-04-18 20:27:05'), location: "Weyburn Terrace 785, Apt 072")
end

Post.delete_all
1000.times do |i|
	Post.create!(id: i,
				 user_id: i/10, 
				 title: "test post" + i.to_s, 
				 datetime: DateTime.parse('2015-04-18 20:27:05'), 
				 content: "test content", 
				 post_image_file_name: 'thumb.jpg',
				 post_image_content_type: 'image/jpeg',
				 post_image_file_size: 81973,
				 post_image_updated_at: DateTime.parse('2015-04-18 20:27:05'),
				 created_at: DateTime.parse('2015-04-18 20:27:05'),
				 latitude: '34.0637725',
				 longitude: '-118.4515723',
				 image_file_name: 'thumb.jpg',
				 image_content_type: 'image/jpeg',
				 image_file_size: 81973,
				 image_updated_at: DateTime.parse('2015-04-18 20:27:05'),
				 ip_address: "128.3.60.0")
end

Comment.delete_all
5000.times do |i|
	Comment.create!(id: i,
					post_id: i/5,
					user_id: i%100,
					content: "test comment",
					datetime: DateTime.parse('2015-04-18 20:27:05'),
					created_at: DateTime.parse('2015-04-18 20:27:05'),
					read: true)
end

Tagging.delete_all

