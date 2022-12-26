# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

seed_users = [["rega1237@mail.com", "Rafael Guzman"], ["olga@mail.com", "Olga Barrios"], ["hugo@mail.com", "Hugo Gomez"], ["jhon@mail.com", "Jhon Doe"]]

seed_services = ["Olga Cake's", "Wash your car", "Good Luk Barber Shop", "Cacao Desing's", "Manu Vet's", "Impulso C.A", "YMCA Plumbers", "Key Car's", "Mechatronics Leo", "Cute Garden", "Mohamed Shoes", "Plus Pharma", "Michael Burger's", "Adri Style's", "Genus Company", "Crazy Cleaners"]
seed_description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec pellentesque, mi vel vestibulum pulvinar, ex mauris suscipit purus, ut condimentum velit orci non lectus. Proin et sapien a ex facilisis imperdiet. Aliquam lobortis pulvinar urna, vitae semper dolor rutrum eget. Pellentesque pulvinar felis nulla, ut ullamcorper tortor imperdiet non. Ut lobortis dictum sollicitudin. Suspendisse pellentesque ultricies libero at sagittis. Ut nec ligula ac mi accumsan vehicula non at tortor. Praesent nulla enim, volutpat nec porta quis, porta quis lacus. Quisque gravida facilisis nisl, non ultrices velit eleifend in. Morbi laoreet dolor diam, vitae sollicitudin lacus hendrerit in. Maecenas varius massa id erat scelerisque, sit amet auctor sem lacinia. In ut turpis quis diam placerat vestibulum in ultricies tortor. Morbi ac justo velit. Sed elit neque, euismod id tortor ut, ullamcorper convallis nisl.

Phasellus lobortis, nisl sed euismod tincidunt, turpis mauris dictum sapien, nec consequat est tortor bibendum nunc. Quisque vel neque nec elit sodales finibus sed quis felis. Nulla quis malesuada diam. Vivamus blandit metus gravida nulla dictum lacinia. Ut eget sagittis nisi. Aliquam sit amet risus cursus arcu semper ultrices. Fusce ut nisl enim. Praesent vitae tincidunt arcu, eget pellentesque nisl. Etiam purus nulla, commodo a hendrerit sit amet."

seed_categories = ["Cakes",  "Barber", "Design", "Vet", "Plumbers", "Mechanics", "Electronic", "Gardeners", "Pharmacy", "Restaurants", "Cleaners"]

seed_comments = [[1, "Very bad service", "Horrible"], [2, "Bad service", "The owner bad client service"], [3, "Very good service", "Excellent client service"], [4, "Excellent service", "Excellent price and quality"], [5, "Excellent service", "The best in the city"]] 

def create_users(users)
  puts "Creating users..."
  users.each_with_index do |user, index|
    if index == 0
      user = User.new(email: user[0], full_name: user[1] , admin:true)
    else
      user = User.new(email: user[0], full_name: user[1])
    end
    user.password = "123456"
    user.skip_confirmation!
    user.save
  end 
  puts "Users created!"
end

def create_categories(categories)
  puts "Creating categories..."
  categories.each do |category|
    category = Category.create(name: category, active: true)
    category.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'categories', "#{category.name}.jpg")), filename: "#{category}.jpg", content_type: 'image/jpg')
  end
  puts "Categories created!"
end

def create_services(services, description)
  puts "Creating services..."
  services.each do |service|
    service = Service.new(name: service, description: description, user_id: User.all.sample.id)
    service.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', "logo_wb.png")), filename: "logo_wb.png", content_type: 'image/png')
    service.save
    2.times do
      service.categories << Category.all.sample
    end
  end
  puts "Services created!"
end

def create_comments(comments)
  puts "Creating comments..."
  comments.each do |comment|
    10.times do
      service = Service.all.sample
      user = User.all.sample
      if service.user_id != user.id && !service.comments.where(user_id: user.id).exists?
        Comment.create(user_id: user.id, service_id: service.id, rating: comment[0], body: comment[1], title: comment[2])
      else
        Comment.create(user_id: User.all.sample.id, service_id: service.id, rating: comment[0], body: comment[1], title: comment[2])
      end
    end
  end
  puts "Comments created!"
end

create_users(seed_users)
create_categories(seed_categories)
create_services(seed_services, seed_description)
create_comments(seed_comments)