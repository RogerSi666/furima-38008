test_user_1 = User.create(nickname: "太郎", email: "taro@taro", password: "tarotaro")
test_user_2 = User.create(nickname: "花子", email: "hanako@hanako", password: "hanakohanako")

item_1 = Item.new(
 title: "スマートフォン",
 category_id: 1,
 price: 50000,
 user_id: test_user_1.id
 )
item_1.image.attach(io: File.open(Rails.root.join("./app/assets/images/icon_camera.png")), filename: 'icon_camera.png')
item_1.save