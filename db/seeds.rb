photos_data = [
  {
    title:       "MacBook",
    description: "Macbook from Apple",
    category:    "Technology",
    likes:       rand(1..100),
    tags:        "macbook, apple, laptop",
    taken_at:    Time.zone.now - rand(1..365).days,
    image_path:  "app/assets/images/image1.jpg"
  },
  {
    title:       "iPhone Banner",
    description: "iPhone banner with different colors",
    category:    "Technology",
    likes:       rand(1..100),
    tags:        "iphone, banner, colors",
    taken_at:    Time.zone.now - rand(1..365).days,
    image_path:  "app/assets/images/image2.png"
  },
  {
    title:       "Hanging Out",
    description: "People hanging out",
    category:    "Social",
    likes:       rand(1..100),
    tags:        "friends, hanging out, social",
    taken_at:    Time.zone.now - rand(1..365).days,
    image_path:  "app/assets/images/image3.jpg"
  },
  {
    title:       "iPhone 14",
    description: "iPhone showcase",
    category:    "Technology",
    likes:       rand(1..100),
    tags:        "iphone, showcase, new",
    taken_at:    Time.zone.now - rand(1..365).days,
    image_path:  "app/assets/images/image4.jpg"
  },
  {
    title:       "Atreus Kratos",
    description: "Kratos consoling Atreus",
    category:    "Game",
    likes:       rand(1..100),
    tags:        "atreus, kratos, game",
    taken_at:    Time.zone.now - rand(1..365).days,
    image_path:  "app/assets/images/image5.png"
  },
  {
    title:       "God of War",
    description: "Kratos fighting a dragon",
    category:    "Game",
    likes:       rand(1..100),
    tags:        "kratos, dragon, game",
    taken_at:    Time.zone.now - rand(1..365).days,
    image_path:  "app/assets/images/image6.png"
  },
  {
    title:       "iOS Logo",
    description: "iOS Logo 2024",
    category:    "Technology",
    likes:       rand(1..100),
    tags:        "ios, logo, apple",
    taken_at:    Time.zone.now - rand(1..365).days,
    image_path:  "app/assets/images/image7.png"
  },
  {
    title:       "Genshin Background",
    description: "1080p Genshin Impact Background",
    category:    "Game",
    likes:       rand(1..100),
    tags:        "genshin, impact, game",
    taken_at:    Time.zone.now - rand(1..365).days,
    image_path:  "app/assets/images/image8.jpg"
  },
  {
    title:       "Paimon",
    description: "Genshin Logo",
    category:    "Game",
    likes:       rand(1..100),
    tags:        "paimon, logo, genshin",
    taken_at:    Time.zone.now - rand(1..365).days,
    image_path:  "app/assets/images/image9.jpg"
  },
  {
    title:       "Ubuntu Jellyfish",
    description: "Ubuntu banner",
    category:    "Technology",
    likes:       rand(1..100),
    tags:        "ubuntu, jellyfish, linux",
    taken_at:    Time.zone.now - rand(1..365).days,
    image_path:  "app/assets/images/image10.jpg"
  },
  {
    title:       "iPhone 13",
    description: "iPhone Banner for iPhone 13",
    category:    "Technology",
    likes:       rand(1..100),
    tags:        "iphone, 13, banner",
    taken_at:    Time.zone.now - rand(1..365).days,
    image_path:  "app/assets/images/image11.jpg"
  },
  {
    title:       "MacBook Education",
    description: "MacBook meant for performance and productivity.",
    category:    "Technology",
    likes:       rand(1..100),
    tags:        "macbook, education, productivity",
    taken_at:    Time.zone.now - rand(1..365).days,
    image_path:  "app/assets/images/image12.png"
  },
  {
    title:       "iPhone Showcase",
    description: "iPhone Banner for website",
    category:    "Technology",
    likes:       rand(1..100),
    tags:        "iphone, showcase, website",
    taken_at:    Time.zone.now - rand(1..365).days,
    image_path:  "app/assets/images/image13.jpg"
  },
  {
    title:       "Cute Cartoon",
    description: "Cute little anime character",
    category:    "Cartoon",
    likes:       rand(1..100),
    tags:        "cute, cartoon, anime",
    taken_at:    Time.zone.now - rand(1..365).days,
    image_path:  "app/assets/images/image14.jpg"
  },
  {
    title:       "Digital Character",
    description: "Fanart anime character",
    category:    "Cartoon",
    likes:       rand(1..100),
    tags:        "digital, character, fanart",
    taken_at:    Time.zone.now - rand(1..365).days,
    image_path:  "app/assets/images/image15.jpg"
  },
  {
    title:       "Cartoon Boy",
    description: "Cute cartoon boy",
    category:    "Cartoon",
    likes:       rand(1..100),
    tags:        "cartoon, boy, cute",
    taken_at:    Time.zone.now - rand(1..365).days,
    image_path:  "app/assets/images/image16.jpg"
  },
  {
    title:       "Internet Vector",
    description: "Laptop Computer-Man Vector",
    category:    "Technology",
    likes:       rand(1..100),
    tags:        "internet, vector, laptop",
    taken_at:    Time.zone.now - rand(1..365).days,
    image_path:  "app/assets/images/image17.png"
  },
  {
    title:       "Winnie the Pooh",
    description: "Cute winnie the pooh",
    category:    "Cartoon",
    likes:       rand(1..100),
    tags:        "winnie, pooh, cute",
    taken_at:    Time.zone.now - rand(1..365).days,
    image_path:  "app/assets/images/image18.jpg"
  },
  {
    title:       "Cute Anime Character",
    description: "Anime Character",
    category:    "Cartoon",
    likes:       rand(1..100),
    tags:        "cute, anime, character",
    taken_at:    Time.zone.now - rand(1..365).days,
    image_path:  "app/assets/images/image19.jpg"
  },
  {
    title:       "Cute Bears2",
    description: "Cute bears sleeping",
    category:    "Cartoon",
    likes:       rand(1..100),
    tags:        "cute, bears, sleeping",
    taken_at:    Time.zone.now - rand(1..365).days,
    image_path:  "app/assets/images/image20.jpg"
  }
]

# Create photos from seed data
photos_data.each do |photo_data|
  photo = Photo.new(
    title:       photo_data[:title],
    description: photo_data[:description],
    category:    photo_data[:category],
    likes:       photo_data[:likes],
    tags:        photo_data[:tags],
    taken_at:    photo_data[:taken_at]
  )
  # Attach image using Active Storage
  photo.image.attach(io:       File.open(Rails.root.join(photo_data[:image_path])),
                     filename: File.basename(photo_data[:image_path]))
  photo.save!
end
