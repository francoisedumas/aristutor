# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning Database"
Mistake.destroy_all
Word.destroy_all
Summary.destroy_all
Course.destroy_all
TeacherLanguage.destroy_all
Teacher.destroy_all
Student.destroy_all
puts "Database cleaned"

puts "Generate teacher seeds"

john = Teacher.create!(first_name: "John", last_name: "Doe", email: "john@lewagon.com", password: "azerty", about: "English teacher, 7 years of experience")
file = File.open(Rails.root.join('db/seeds/teacher_images/john.jpg'))
john.photo.attach(io: file, filename: 'john.jpg', content_type: 'image/jpg')
john.save!

brice = Teacher.create!(first_name: "Brice", last_name: "Nice", email: "brice@lewagon.com", password: "azerty", about: "English teacher, 4 years of experience")
file = File.open(Rails.root.join('db/seeds/teacher_images/françois.jpg'))
brice.photo.attach(io: file, filename: 'david.jpg', content_type: 'image/jpg')
brice.save!

puts "Teachers well generated"

puts "Generate student seeds"

sophie = Student.create!(first_name: "Sophie", last_name: "Martin", phone_number: "+33742424242", mother_language: "FR", email: "sophie@lewagon.com", password: "azerty")
file = File.open(Rails.root.join('db/seeds/student_images/sophie.jpg'))
sophie.photo.attach(io: file, filename: 'sophie.jpg', content_type: 'image/jpg')
sophie.save!

arnaud = Student.create!(first_name: "Arnaud", last_name: "Demarre", phone_number: "+33642424242", mother_language: "FR", email: "arnaud@lewagon.com", password: "azerty")
file = File.open(Rails.root.join('db/seeds/student_images/arnaud.jpg'))
arnaud.photo.attach(io: file, filename: 'arnaud.jpg', content_type: 'image/jpg')
arnaud.save!

pedro = Student.create!(first_name: "Pedro", last_name: "Vasquez", phone_number: "+34642424242", mother_language: "ES", email: "pedro@lewagon.com", password: "azerty")
file = File.open(Rails.root.join('db/seeds/student_images/pedro.jpg'))
pedro.photo.attach(io: file, filename: 'pedro.jpg', content_type: 'image/jpg')
pedro.save!

kate = Student.create!(first_name: "Kate", last_name: "Robins", phone_number: "+33642424241", mother_language: "FR", email: "kate@lewagon.com", password: "azerty")
file = File.open(Rails.root.join('db/seeds/student_images/kate.jpg'))
kate.photo.attach(io: file, filename: 'kate.jpg', content_type: 'image/jpg')
kate.save!

jerome = Student.create!(first_name: "Jerome", last_name: "La Roche", phone_number: "+33742424240", mother_language: "FR", email: "jerome@lewagon.com", password: "azerty")
file = File.open(Rails.root.join('db/seeds/student_images/jerome.jpg'))
jerome.photo.attach(io: file, filename: 'jerome.jpg', content_type: 'image/jpg')
jerome.save!

jaime = Student.create!(first_name: "Jaime", last_name: "Ribeiro", phone_number: "+351742424242", mother_language: "PT", email: "jaime@lewagon.com", password: "azerty")
file = File.open(Rails.root.join('db/seeds/student_images/jaime.jpg'))
jaime.photo.attach(io: file, filename: 'jaime.jpg', content_type: 'image/jpg')
jaime.save!

juan = Student.create!(first_name: "Juan", last_name: "Benitez", phone_number: "+34742424242", mother_language: "ES", email: "juan@lewagon.com", password: "azerty")
file = File.open(Rails.root.join('db/seeds/student_images/juan.jpg'))
juan.photo.attach(io: file, filename: 'juan.jpg', content_type: 'image/jpg')
juan.save!

michele = Student.create!(first_name: "Michele", last_name: "Rodriguez", phone_number: "+351642424242", mother_language: "PT", email: "michele@lewagon.com", password: "azerty")
file = File.open(Rails.root.join('db/seeds/student_images/michele.jpg'))
michele.photo.attach(io: file, filename: 'michele.jpg', content_type: 'image/jpg')
michele.save!

yoann = Student.create!(first_name: "Yoann", last_name: "Madec", phone_number: "+339642424242", mother_language: "FR", email: "yoann@lewagon.com", password: "azerty")
file = File.open(Rails.root.join('db/seeds/student_images/yoann.jpg'))
yoann.photo.attach(io: file, filename: 'yoann.jpg', content_type: 'image/jpg')
yoann.save!

sammy = Student.create!(first_name: "Sammy", last_name: "Vargas", phone_number: "+3485542424242", mother_language: "ES", email: "sammy@lewagon.com", password: "azerty")
file = File.open(Rails.root.join('db/seeds/student_images/sammy.jpg'))
sammy.photo.attach(io: file, filename: 'sammy.jpg', content_type: 'image/jpg')
sammy.save!

francois = Student.create!(first_name: "Francois", last_name: "Dumas", phone_number: "+33766187954", mother_language: "FR", email: "dumas.francois@laposte.net", password: "azerty")
file = File.open(Rails.root.join('db/seeds/student_images/francois.jpg'))
francois.photo.attach(io: file, filename: 'francois.jpg', content_type: 'image/jpg')
francois.save!

puts "Students well generated"

puts "Generate Course seeds"

course_brice_sophie = Course.create!(teacher: brice, student: sophie, class_language: "EN")
course_john_arnaud = Course.create!(teacher: john, student: arnaud, class_language: "EN")
course_brice_pedro = Course.create!(teacher: brice, student: pedro, class_language: "EN")
course_brice_kate = Course.create!(teacher: brice, student: kate, class_language: "EN")
course_brice_jerome = Course.create!(teacher: brice, student: jerome, class_language: "EN")
course_brice_jaime = Course.create!(teacher: brice, student: jaime, class_language: "EN")
course_brice_juan= Course.create!(teacher: brice, student: juan, class_language: "EN")
course_brice_michele = Course.create!(teacher: brice, student: michele, class_language: "EN")
# course_brice_yoann = Course.create!(teacher: brice, student: yoann, class_language: "EN")
# course_brice_sammy = Course.create!(teacher: brice, student: sammy, class_language: "EN")
course_brice_francois = Course.create!(teacher: brice, student: francois, class_language: "EN")

puts "Courses well generated"

puts "Generate Summaries seeds"

# Test refactorisation

#============================================================================

# vehicle_summary_1 = Summary.create!(title: "vehicles", course: course_brice_sophie)
# vehicle_summary_2 = Summary.create!(title: "vehicles", course: course_brice_pedro)
# vehicle_summary_3 = Summary.create!(title: "vehicles", course: course_brice_kate)
# vehicle_summary_4 = Summary.create!(title: "vehicles", course: course_brice_jaime)
# vehicle_summary_5 = Summary.create!(title: "vehicles", course: course_brice_michele)
# vehicle_summaries = [vehicle_summary_1, vehicle_summary_2, vehicle_summary_3, vehicle_summary_4, vehicle_summary_5]

# mistake_1 = Mistake.new(wrong_content: "car police" , correct_content: "police car" , status: "created")
# mistake_2 = Mistake.new(wrong_content: "the car red" , correct_content: "the red car" , status: "created")
# mistake_3 = Mistake.new(wrong_content: "truck delivery" , correct_content: "delivery truck" , status: "created")
# mistake_4 = Mistake.new(wrong_content: "a taxi yellow" , correct_content: "a yellow taxi" , status: "created")
# vehicle_mistakes = [mistake_1, mistake_2, mistake_3, mistake_4]

# word_1 = Word.new(word: "car" , translation: "voiture" , status: "created")
# word_2 = Word.new(word: "boat" , translation: "bateau" , status: "created")
# word_3 = Word.new(word: "truck" , translation: "camion" , status: "created")
# word_4 = Word.new(word: "plane" , translation: "avion" , status: "created")
# vehicle_words = [word_1, word_2, word_3, word_4]

# vehicle_summaries.shuffle.each do |summary|
#   vehicle_mistakes.shuffle.each_with_index do |tmp_mistake, index|
#     word    = vehicle_words[index].dup
#     mistake = tmp_mistake.dup
#     mistake.summary = summary
#     word.summary    = summary
#     mistake.save!
#     word.save!
#   end
#   if index < 3 # percent of passed
#     summary.status = 'passed'
#     summary.save!
#   end
# end

# pets_summary_1 = Summary.create!(title: "pets", course: course_brice_sophie)
# pets_summary_2 = Summary.create!(title: "pets", course: course_brice_pedro)
# pets_summary_3 = Summary.create!(title: "pets", course: course_brice_jerome)
# pets_summary_4 = Summary.create!(title: "pets", course: course_brice_juan)
# pets_summaries = [pets_summary_1, pets_summary_2, pets_summary_3, pets_summary_4]

# food_summary_1 = Summary.create!(title: "food", course: course_brice_sophie)
# food_summary_2 = Summary.create!(title: "food", course: course_brice_pedro)
# food_summary_3 = Summary.create!(title: "food", course: course_brice_kate)
# food_summary_4 = Summary.create!(title: "food", course: course_brice_michele)
# food_summary_5 = Summary.create!(title: "food", course: course_brice_sammy)
# food_summaries = [food_summary_1, food_summary_2, food_summary_3, food_summary_4, food_summary_5]

# geography_summary_1 = Summary.create!(title: "geography", course: course_brice_sophie)
# geography_summary_2 = Summary.create!(title: "geography", course: course_brice_jerome)
# geography_summary_3 = Summary.create!(title: "geography", course: course_brice_jaime)
# geography_summary_4 = Summary.create!(title: "geography", course: course_brice_yoann)
# geography_summaries = [geography_summary_1, geography_summary_2, geography_summary_3, geography_summary_4]

#==============================================================================

summary_1 = Summary.create!(title: "vehicles", course: course_brice_sophie)
summary_2 = Summary.create!(title: "vehicles", course: course_brice_francois)
summary_3 = Summary.create!(title: "vehicles", course: course_brice_jaime, status: "passed")
summary_4 = Summary.create!(title: "vehicles", course: course_brice_michele, status: "passed")
summary_5 = Summary.create!(title: "vehicles", course: course_brice_kate, status: "passed")
summary_6 = Summary.create!(title: "vehicles", course: course_brice_kate, status: "passed")
summary_7 = Summary.create!(title: "vehicles", course: course_brice_jerome, status: "passed")

summary_8 = Summary.create!(title: "pets", course: course_brice_pedro, status: "passed")
summary_9 = Summary.create!(title: "pets", course: course_brice_jerome, status: "passed")
summary_10 = Summary.create!(title: "pets", course: course_brice_juan)

summary_11 = Summary.create!(title: "food", course: course_brice_pedro)
summary_12 = Summary.create!(title: "food", course: course_brice_michele)
# summary_13 = Summary.create!(title: "food", course: course_brice_sophie, status: "passed")
summary_14 = Summary.create!(title: "food", course: course_brice_kate)

# summary_15 = Summary.create!(title: "geography", course: course_brice_sophie, status: "passed")
summary_16 = Summary.create!(title: "geography", course: course_brice_jerome, status: "passed")
summary_17 = Summary.create!(title: "geography", course: course_brice_francois, status: "passed")


# summary_19 = Summary.create!(title: "colors", course: course_brice_jerome)
# summary_20 = Summary.create!(title: "travels", course: course_brice_jaime)
# summary_21 = Summary.create!(title: "jobs", course: course_brice_juan)
# summary_22 = Summary.create!(title: "weather", course: course_brice_michele)
# summary_23 = Summary.create!(title: "pets", course: course_brice_yoann)
# summary_24 = Summary.create!(title: "food", course: course_brice_sammy, status: "passed")

puts "Summaries well generated"

puts "Generate Mistakes seeds"

# vehicles

 mistake_1 = Mistake.create!(wrong_content: "the car red" , correct_content: "the red car" , status: "created", summary: summary_1)
 mistake_2 = Mistake.create!(wrong_content: "truck delivery" , correct_content: "delivery truck" , status: "created", summary: summary_1)
 mistake_3 = Mistake.create!(wrong_content: "a taxi yellow" , correct_content: "a yellow taxi" , status: "created", summary: summary_1)

 mistake_1 = Mistake.create!(wrong_content: "the car red" , correct_content: "the red car" , status: "created", summary: summary_2)
 mistake_2 = Mistake.create!(wrong_content: "truck delivery" , correct_content: "delivery truck" , status: "created", summary: summary_2)
 mistake_3 = Mistake.create!(wrong_content: "a taxi yellow" , correct_content: "a yellow taxi" , status: "created", summary: summary_2)

 mistake_1 = Mistake.create!(wrong_content: "the car red" , correct_content: "the red car" , status: "created", summary: summary_3)
 mistake_2 = Mistake.create!(wrong_content: "truck delivery" , correct_content: "delivery truck" , status: "created", summary: summary_3)
 mistake_3 = Mistake.create!(wrong_content: "a taxi yellow" , correct_content: "a yellow taxi" , status: "created", summary: summary_3)

 mistake_1 = Mistake.create!(wrong_content: "the car red" , correct_content: "the red car" , status: "created", summary: summary_4)
 mistake_2 = Mistake.create!(wrong_content: "truck delivery" , correct_content: "delivery truck" , status: "created", summary: summary_4)
 mistake_3 = Mistake.create!(wrong_content: "a taxi yellow" , correct_content: "a yellow taxi" , status: "created", summary: summary_4)

 mistake_1 = Mistake.create!(wrong_content: "the car red" , correct_content: "the red car" , status: "created", summary: summary_5)
 mistake_2 = Mistake.create!(wrong_content: "truck delivery" , correct_content: "delivery truck" , status: "created", summary: summary_5)
 mistake_3 = Mistake.create!(wrong_content: "a taxi yellow" , correct_content: "a yellow taxi" , status: "created", summary: summary_5)

 mistake_1 = Mistake.create!(wrong_content: "the car red" , correct_content: "the red car" , status: "created", summary: summary_6)
 mistake_2 = Mistake.create!(wrong_content: "truck delivery" , correct_content: "delivery truck" , status: "created", summary: summary_6)
 mistake_3 = Mistake.create!(wrong_content: "a taxi yellow" , correct_content: "a yellow taxi" , status: "created", summary: summary_6)

 mistake_1 = Mistake.create!(wrong_content: "the car red" , correct_content: "the red car" , status: "created", summary: summary_7)
 mistake_2 = Mistake.create!(wrong_content: "truck delivery" , correct_content: "delivery truck" , status: "created", summary: summary_7)
 mistake_3 = Mistake.create!(wrong_content: "a taxi yellow" , correct_content: "a yellow taxi" , status: "created", summary: summary_7)

 # pets

mistake_4 = Mistake.create!(wrong_content: "the butterfly are flying" , correct_content: "the butterflies are flying" , status: "created", summary: summary_8)
mistake_5 = Mistake.create!(wrong_content: "the dog blue" , correct_content: "the blue dog" , status: "created", summary: summary_8)

mistake_4 = Mistake.create!(wrong_content: "the butterfly are flying" , correct_content: "the butterflies are flying" , status: "created", summary: summary_9)
mistake_5 = Mistake.create!(wrong_content: "the dog blue" , correct_content: "the blue dog" , status: "created", summary: summary_9)

mistake_4 = Mistake.create!(wrong_content: "the butterfly are flying" , correct_content: "the butterflies are flying" , status: "created", summary: summary_10)
mistake_5 = Mistake.create!(wrong_content: "the dog blue" , correct_content: "the blue dog" , status: "created", summary: summary_10)

# food

mistake_6 = Mistake.create!(wrong_content: "the bacon were baked" , correct_content: "the bacon was baked" , status: "passed", summary: summary_11)
mistake_7 = Mistake.create!(wrong_content: "the fish is cool" , correct_content: "the fish is fresh" , status: "passed", summary: summary_11)
mistake_8 = Mistake.create!(wrong_content: "limonade" , correct_content: "lemonade" , status: "passed", summary: summary_11)

mistake_6 = Mistake.create!(wrong_content: "the bacon were baked" , correct_content: "the bacon was baked" , status: "passed", summary: summary_12)
mistake_7 = Mistake.create!(wrong_content: "the fish is cool" , correct_content: "the fish is fresh" , status: "passed", summary: summary_12)
mistake_8 = Mistake.create!(wrong_content: "limonade" , correct_content: "lemonade" , status: "passed", summary: summary_12)

# mistake_6 = Mistake.create!(wrong_content: "the bacon were baked" , correct_content: "the bacon was baked" , status: "passed", summary: summary_13)
# mistake_7 = Mistake.create!(wrong_content: "the fish is cool" , correct_content: "the fish is fresh" , status: "passed", summary: summary_13)
# mistake_8 = Mistake.create!(wrong_content: "limonade" , correct_content: "lemonade" , status: "passed", summary: summary_13)

mistake_6 = Mistake.create!(wrong_content: "the bacon were baked" , correct_content: "the bacon was baked" , status: "passed", summary: summary_14)
mistake_7 = Mistake.create!(wrong_content: "the fish is cool" , correct_content: "the fish is fresh" , status: "passed", summary: summary_14)
mistake_8 = Mistake.create!(wrong_content: "limonade" , correct_content: "lemonade" , status: "passed", summary: summary_14)

# geography

# mistake_9 = Mistake.create!(wrong_content: "the ocean pacific" , correct_content: "the pacific ocean" , status: "failed", summary: summary_15)
# mistake_10 = Mistake.create!(wrong_content: "valley of death" , correct_content: "death valley" , status: "failed", summary: summary_15)
# mistake_11 = Mistake.create!(wrong_content: "islande" , correct_content: "iceland" , status: "failed", summary: summary_15)

mistake_9 = Mistake.create!(wrong_content: "the ocean pacific" , correct_content: "the pacific ocean" , status: "failed", summary: summary_16)
mistake_10 = Mistake.create!(wrong_content: "valley of death" , correct_content: "death valley" , status: "failed", summary: summary_16)
mistake_11 = Mistake.create!(wrong_content: "islande" , correct_content: "iceland" , status: "failed", summary: summary_16)

mistake_9 = Mistake.create!(wrong_content: "the ocean pacific" , correct_content: "the pacific ocean" , status: "failed", summary: summary_17)
mistake_10 = Mistake.create!(wrong_content: "valley of death" , correct_content: "death valley" , status: "failed", summary: summary_17)
mistake_11 = Mistake.create!(wrong_content: "islande" , correct_content: "iceland" , status: "failed", summary: summary_17)

puts "Mistakes well generated"

puts "Generate Words seeds"

# vehicles

word_1 = Word.create!(word: "car" , translation: "voiture" , status: "created", summary: summary_1)
word_2 = Word.create!(word: "boat" , translation: "bateau" , status: "created", summary: summary_1)
word_3 = Word.create!(word: "truck" , translation: "camion" , status: "created", summary: summary_1)
word_4 = Word.create!(word: "submarine" , translation: "sous-marin" , status: "created", summary: summary_1)

word_1 = Word.create!(word: "car" , translation: "voiture" , status: "created", summary: summary_2)
word_2 = Word.create!(word: "boat" , translation: "bateau" , status: "created", summary: summary_2)
word_3 = Word.create!(word: "truck" , translation: "camion" , status: "created", summary: summary_2)
word_4 = Word.create!(word: "submarine" , translation: "sous-marin" , status: "created", summary: summary_2)


word_1 = Word.create!(word: "car" , translation: "voiture" , status: "created", summary: summary_3)
word_2 = Word.create!(word: "boat" , translation: "bateau" , status: "created", summary: summary_3)
word_3 = Word.create!(word: "truck" , translation: "camion" , status: "created", summary: summary_3)
word_4 = Word.create!(word: "submarine" , translation: "sous-marin" , status: "created", summary: summary_3)


word_1 = Word.create!(word: "car" , translation: "voiture" , status: "created", summary: summary_4)
word_2 = Word.create!(word: "boat" , translation: "bateau" , status: "created", summary: summary_4)
word_3 = Word.create!(word: "truck" , translation: "camion" , status: "created", summary: summary_4)
word_4 = Word.create!(word: "submarine" , translation: "sous-marin" , status: "created", summary: summary_4)


word_1 = Word.create!(word: "car" , translation: "voiture" , status: "created", summary: summary_5)
word_2 = Word.create!(word: "boat" , translation: "bateau" , status: "created", summary: summary_5)
word_3 = Word.create!(word: "truck" , translation: "camion" , status: "created", summary: summary_5)
word_4 = Word.create!(word: "submarine" , translation: "sous-marin" , status: "created", summary: summary_5)

word_1 = Word.create!(word: "car" , translation: "voiture" , status: "created", summary: summary_6)
word_2 = Word.create!(word: "boat" , translation: "bateau" , status: "created", summary: summary_6)
word_3 = Word.create!(word: "truck" , translation: "camion" , status: "created", summary: summary_6)
word_4 = Word.create!(word: "submarine" , translation: "sous-marin" , status: "created", summary: summary_6)

word_1 = Word.create!(word: "car" , translation: "voiture" , status: "created", summary: summary_7)
word_2 = Word.create!(word: "boat" , translation: "bateau" , status: "created", summary: summary_7)
word_3 = Word.create!(word: "truck" , translation: "camion" , status: "created", summary: summary_7)
word_4 = Word.create!(word: "submarine" , translation: "sous-marin" , status: "created", summary: summary_7)

# pets

word_7 = Word.create!(word: "parrot" , translation: "perroquet" , status: "created", summary: summary_8)
word_8 = Word.create!(word: "veterinarian" , translation: "vétérinaire" , status: "created", summary: summary_8)
word_9 = Word.create!(word: "hedgehog" , translation: "hérisson" , status: "created", summary: summary_8)
word_10 = Word.create!(word: "horse" , translation: "cheval" , status: "created", summary: summary_8)

word_7 = Word.create!(word: "parrot" , translation: "perroquet" , status: "created", summary: summary_9)
word_8 = Word.create!(word: "veterinarian" , translation: "vétérinaire" , status: "created", summary: summary_9)
word_9 = Word.create!(word: "hedgehog" , translation: "hérisson" , status: "created", summary: summary_9)
word_10 = Word.create!(word: "horse" , translation: "cheval" , status: "created", summary: summary_9)

word_7 = Word.create!(word: "parrot" , translation: "perroquet" , status: "created", summary: summary_10)
word_8 = Word.create!(word: "veterinarian" , translation: "vétérinaire" , status: "created", summary: summary_10)
word_9 = Word.create!(word: "hedgehog" , translation: "hérisson" , status: "created", summary: summary_10)
word_10 = Word.create!(word: "horse" , translation: "cheval" , status: "created", summary: summary_10)

# food

word_11 = Word.create!(word: "spinach" , translation: "épinard" , status: "created", summary: summary_11)
word_12 = Word.create!(word: "egg" , translation: "oeuf" , status: "created", summary: summary_11)
word_13 = Word.create!(word: "lemon" , translation: "citron" , status: "created", summary: summary_11)
word_14 = Word.create!(word: "pasta" , translation: "pâtes" , status: "created", summary: summary_11)

word_11 = Word.create!(word: "spinach" , translation: "épinard" , status: "created", summary: summary_12)
word_12 = Word.create!(word: "egg" , translation: "oeuf" , status: "created", summary: summary_12)
word_13 = Word.create!(word: "lemon" , translation: "citron" , status: "created", summary: summary_12)
word_14 = Word.create!(word: "pasta" , translation: "pâtes" , status: "created", summary: summary_12)

# word_11 = Word.create!(word: "spinach" , translation: "épinard" , status: "created", summary: summary_13)
# word_12 = Word.create!(word: "egg" , translation: "oeuf" , status: "created", summary: summary_13)
# word_13 = Word.create!(word: "lemon" , translation: "citron" , status: "created", summary: summary_13)
# word_14 = Word.create!(word: "pasta" , translation: "pâtes" , status: "created", summary: summary_13)

word_11 = Word.create!(word: "spinach" , translation: "épinard" , status: "created", summary: summary_14)
word_12 = Word.create!(word: "egg" , translation: "oeuf" , status: "created", summary: summary_14)
word_13 = Word.create!(word: "lemon" , translation: "citron" , status: "created", summary: summary_14)
word_14 = Word.create!(word: "pasta" , translation: "pâtes" , status: "created", summary: summary_14)

# geography

# word_15 = Word.create!(word: "earth" , translation: "terre" , status: "created", summary: summary_15)
# word_16 = Word.create!(word: "lebanon" , translation: "liban" , status: "created", summary: summary_15)
# word_17 = Word.create!(word: "the english channel" , translation: "la manche", status: "created", summary: summary_15)
# word_18 = Word.create!(word: "meadow" , translation: "prairie" , status: "created", summary: summary_15)

word_15 = Word.create!(word: "earth" , translation: "terre" , status: "created", summary: summary_16)
word_16 = Word.create!(word: "lebanon" , translation: "liban" , status: "created", summary: summary_16)
word_17 = Word.create!(word: "the english channel" , translation: "la manche", status: "created", summary: summary_16)
word_18 = Word.create!(word: "meadow" , translation: "prairie" , status: "created", summary: summary_16)

word_15 = Word.create!(word: "earth" , translation: "terre" , status: "created", summary: summary_17)
word_16 = Word.create!(word: "lebanon" , translation: "liban" , status: "created", summary: summary_17)
word_17 = Word.create!(word: "the english channel" , translation: "la manche", status: "created", summary: summary_17)
word_18 = Word.create!(word: "meadow" , translation: "prairie" , status: "created", summary: summary_17)

puts "Words well generated"