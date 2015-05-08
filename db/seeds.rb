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
image_url: '1.jpg',
downvote_number: 2,
upvote_number: 1)

Post.create!(user_id: 1,
title: 'Post2',
datetime: DateTime.parse('2015-04-18 20:27:05'),
content: 'MyText',
image_url: '2.jpg',
downvote_number: 3,
upvote_number: 2)

Post.create!(user_id: 1,
title: 'Post3',
datetime: DateTime.parse('2015-04-18 20:27:05'),
content: 'MyText',
image_url: '3.jpg',
downvote_number: 4,
upvote_number: 3)

Post.create!(user_id: 1,
title: 'Post4',
datetime: DateTime.parse('2015-04-18 20:27:05'),
content: 'MyText',
image_url: '5.jpg',
downvote_number: 5,
upvote_number: 4)

Post.create!(user_id: 1,
title: 'Post5',
datetime: DateTime.parse('2015-04-18 20:27:05'),
content: 'MyText',
image_url: '4.jpg',
downvote_number: 1,
upvote_number: 1)

Post.create!(user_id: 1,
title: 'Post6',
datetime: DateTime.parse('2015-04-18 20:27:05'),
content: 'MyText',
image_url: '6.jpg',
downvote_number: 1,
upvote_number: 1)

Post.create!(user_id: 1,
title: 'Post7',
datetime: DateTime.parse('2015-04-18 20:27:05'),
content: 'MyText',
image_url: '7.jpg',
downvote_number: 1,
upvote_number: 1)

Post.create!(user_id: 1,
title: 'Post9',
datetime: DateTime.parse('2015-04-18 20:27:05'),
content: 'MyText',
image_url: '8.jpg',
downvote_number: 1,
upvote_number: 1)

Post.create!(user_id: 1,
title: 'Post8',
datetime: DateTime.parse('2015-04-18 20:27:05'),
content: 'MyText',
image_url: '9.jpg',
downvote_number: 1,
upvote_number: 1)

Post.create!(user_id: 1,
title: 'Post15',
datetime: DateTime.parse('2015-04-18 20:27:05'),
content: 'MyText',
image_url: '10.jpg',
downvote_number: 1,
upvote_number: 1)

Post.create!(user_id: 1,
title: 'Post11',
datetime: DateTime.parse('2015-04-18 20:27:05'),
content: 'MyText',
image_url: '11.jpg',
downvote_number: 1,
upvote_number: 1)

Post.create!(user_id: 1,
title: 'Post12',
datetime: DateTime.parse('2015-04-18 20:27:05'),
content: 'MyText',
image_url: '12.jpg',
downvote_number: 1,
upvote_number: 1)

Post.create!(user_id: 1,
title: 'Post13',
datetime: DateTime.parse('2015-04-18 20:27:05'),
content: 'MyText',
image_url: '13.jpg',
downvote_number: 1,
upvote_number: 1)
