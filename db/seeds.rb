User.create(name: "Johnny Appleseed", email: "johnnyappleseed@test.com", phone_number: "2811234567", password: "test")
User.create(name: "Jane Appleseed", email: "janeappleseed@test.com", phone_number: "2810987654", password: "test")

Business.create(name: "Top Golf", description: "Golf, Party Venue, Sports Bar & Restuarant", address: "1030 Memorial Brook Blvd, Houston, TX 77084", price: "10000000", user_id: 1)
Business.create(name: "Big Ben Tavern", description: "Sports Bar & Gastro Pub", address: "636 Hwy 6 Suite 1000, Sugar Land, TX 77478", price: "600000", user_id: 2)

Comment.create(content: "Great place!", business_id: 1, user_id: 1)
Comment.create(content: "Too Expensive", business_id: 1, user_id: 2)
Comment.create(content: "Good food and cheap", business_id: 2, user_id: 1)
Comment.create(content: "Contact to buy", business_id: 2, user_id: 2)

Tag.create(name: "Fun")
Tag.create(name: "Good times")
Tag.create(name: "Cheap drinks")
Tag.create(name: "Good food")
