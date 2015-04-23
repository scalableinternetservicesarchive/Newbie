# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.delete_all
Post.create!(user_id: 1,
title: 'Post1',
datetime: DateTime.parse('2015-04-18 20:27:05'),
content: 'MyText',
image_url: 'Angela_Baby.jpg',
downvote_number: 1,
upvote_number: 1)

Post.create!(user_id: 1,
title: 'Post2',
datetime: DateTime.parse('2015-04-18 20:27:05'),
content: 'MyText',
image_url: 'Angela_Baby.jpg',
downvote_number: 1,
upvote_number: 1)

Post.create!(user_id: 1,
title: 'Post3',
datetime: DateTime.parse('2015-04-18 20:27:05'),
content: 'MyText',
image_url: 'Angela_Baby.jpg',
downvote_number: 1,
upvote_number: 1)
