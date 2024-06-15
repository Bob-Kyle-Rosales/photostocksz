photo1 = Photo.create(
  title:       "MacBook",
  description: "Macbook from Apple",
  category:    "Technology",
  likes:       rand(1..100)
)
photo1.image.attach(io:       File.open(Rails.root.join("app/assets/images/image1.jpg")),
                    filename: "image1.jpg")

photo2 = Photo.create(
  title:       "iPhone Banner",
  description: "iPhone banner with different colors",
  category:    "Technology",
  likes:       rand(1..100)
)
photo2.image.attach(io:       File.open(Rails.root.join("app/assets/images/image2.png")),
                    filename: "image2.png")

photo3 = Photo.create(
  title:       "Hanging Out",
  description: "People hanging out",
  category:    "Social",
  likes:       rand(1..100)
)
photo3.image.attach(io:       File.open(Rails.root.join("app/assets/images/image3.jpg")),
                    filename: "image3.jpg")

photo4 = Photo.create(
  title:       "iPhone 14",
  description: "iPhone showcase",
  category:    "Technology",
  likes:       rand(1..100)
)
photo4.image.attach(io:       File.open(Rails.root.join("app/assets/images/image4.jpg")),
                    filename: "image4.jpg")

photo5 = Photo.create(
  title:       "Atreus Kratos",
  description: "Kratos consoling Atreus",
  category:    "Game",
  likes:       rand(1..100)
)
photo5.image.attach(io:       File.open(Rails.root.join("app/assets/images/image5.png")),
                    filename: "image5.png")

photo6 = Photo.create(
  title:       "God of War",
  description: "Kratos fighting a dragon",
  category:    "Game",
  likes:       rand(1..100)
)
photo6.image.attach(io:       File.open(Rails.root.join("app/assets/images/image6.png")),
                    filename: "image6.png")

photo7 = Photo.create(
  title:       "iOS Logo",
  description: "iOS Logo 2024",
  category:    "Technology",
  likes:       rand(1..100)
)
photo7.image.attach(io:       File.open(Rails.root.join("app/assets/images/image7.png")),
                    filename: "image7.png")

photo8 = Photo.create(
  title:       "Genshin Background",
  description: "1080p Genshin Impact Background",
  category:    "Game",
  likes:       rand(1..100)
)
photo8.image.attach(io:       File.open(Rails.root.join("app/assets/images/image8.jpg")),
                    filename: "image8.jpg")

photo9 = Photo.create(
  title:       "Paimon",
  description: "Genshin Logo",
  category:    "Game",
  likes:       rand(1..100)
)
photo9.image.attach(io:       File.open(Rails.root.join("app/assets/images/image9.jpg")),
                    filename: "image9.jpg")

photo10 = Photo.create(
  title:       "Ubuntu Jellyfish",
  description: "Ubuntu banner",
  category:    "Technology",
  likes:       rand(1..100)
)
photo10.image.attach(io:       File.open(Rails.root.join("app/assets/images/image10.jpg")),
                     filename: "image10.jpg")

photo11 = Photo.create(
  title:       "iPhone 13",
  description: "iPhone Banner for iPhone 13",
  category:    "Technology",
  likes:       rand(1..100)
)
photo11.image.attach(io:       File.open(Rails.root.join("app/assets/images/image11.jpg")),
                     filename: "image11.jpg")

photo12 = Photo.create(
  title:       "MacBook Education",
  description: "MacBook meant for performance and productivity.",
  category:    "Technology",
  likes:       rand(1..100)
)
photo12.image.attach(io:       File.open(Rails.root.join("app/assets/images/image12.png")),
                     filename: "image12.png")

photo13 = Photo.create(
  title:       "iPhone Showcase",
  description: "iPhone Banner for website",
  category:    "Technology",
  likes:       rand(1..100)
)
photo13.image.attach(io:       File.open(Rails.root.join("app/assets/images/image13.jpg")),
                     filename: "image13.jpg")

photo14 = Photo.create(
  title:       "Cute Cartoon",
  description: "Cute little anime character",
  category:    "Cartoon",
  likes:       rand(1..100)
)
photo14.image.attach(io:       File.open(Rails.root.join("app/assets/images/image14.jpg")),
                     filename: "image14.jpg")

photo15 = Photo.create(
  title:       "Digital Character",
  description: "Fanart anime character",
  category:    "Cartoon",
  likes:       rand(1..100)
)
photo15.image.attach(io:       File.open(Rails.root.join("app/assets/images/image15.jpg")),
                     filename: "image15.jpg")

photo16 = Photo.create(
  title:       "Cartoon Boy",
  description: "Cute cartoon boy",
  category:    "Cartoon",
  likes:       rand(1..100)
)
photo16.image.attach(io:       File.open(Rails.root.join("app/assets/images/image16.jpg")),
                     filename: "image16.jpg")

photo17 = Photo.create(
  title:       "Internet Vector",
  description: "Laptop Computer-Man Vector",
  category:    "Technology",
  likes:       rand(1..100)
)
photo17.image.attach(io:       File.open(Rails.root.join("app/assets/images/image17.png")),
                     filename: "image17.png")

photo18 = Photo.create(
  title:       "Winnie the Pooh",
  description: "Cute winnie the pooh",
  category:    "Cartoon",
  likes:       rand(1..100)
)
photo18.image.attach(io:       File.open(Rails.root.join("app/assets/images/image18.jpg")),
                     filename: "image18.jpg")

photo19 = Photo.create(
  title:       "Cute Anime Character",
  description: "Anime Character",
  category:    "Cartoon",
  likes:       rand(1..100)
)
photo19.image.attach(io:       File.open(Rails.root.join("app/assets/images/image19.jpg")),
                     filename: "image19.jpg")

photo20 = Photo.create(
  title:       "Cute Bears",
  description: "Cute bears sleeping",
  category:    "Cartoon",
  likes:       rand(1..100)
)
photo20.image.attach(io:       File.open(Rails.root.join("app/assets/images/image20.jpg")),
                     filename: "image20.jpg")
