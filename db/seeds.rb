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
file = File.open(Rails.root.join('db/seeds/teacher_images/brice.jpg'))
brice.photo.attach(io: file, filename: 'brice.jpg', content_type: 'image/jpg')
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

kate = Student.create!(first_name: "Kate", last_name: "Martin", phone_number: "+33642424241", mother_language: "FR", email: "kate@lewagon.com", password: "azerty")
file = File.open(Rails.root.join('db/seeds/student_images/kate.jpg'))
kate.photo.attach(io: file, filename: 'kate.jpg', content_type: 'image/jpg')
kate.save!

jerome = Student.create!(first_name: "Jerome", last_name: "Daniel", phone_number: "+33742424240", mother_language: "FR", email: "jerome@lewagon.com", password: "azerty")
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

francois = Student.create!(first_name: "Francois", last_name: "Dumas", phone_number: "+33766187954", mother_language: "FR", email: "dumas.francois@laposte.net", password: "azerty")
file = File.open(Rails.root.join('db/seeds/student_images/francois.jpg'))
francois.photo.attach(io: file, filename: 'francois.jpg', content_type: 'image/jpg')
francois.save!

puts "Students well generated"

puts "Generate Course seeds"

course_john_sophie = Course.create!(teacher: john, student: sophie, class_language: "EN")
course_john_arnaud = Course.create!(teacher: john, student: arnaud, class_language: "EN")
course_brice_francois = Course.create!(teacher: brice, student: francois, class_language: "EN")
course_brice_pedro = Course.create!(teacher: brice, student: pedro, class_language: "EN")
course_brice_kate = Course.create!(teacher: brice, student: kate, class_language: "EN")
course_brice_jerome = Course.create!(teacher: brice, student: jerome, class_language: "EN")
course_brice_jaime = Course.create!(teacher: brice, student: jaime, class_language: "EN")
course_brice_juan= Course.create!(teacher: brice, student: juan, class_language: "EN")
course_brice_michele = Course.create!(teacher: brice, student: michele, class_language: "EN")
puts "Courses well generated"

puts "Generate Summaries seeds"

summary_1 = Summary.create!(title: "vehicles", course: course_john_sophie)
summary_2 = Summary.create!(title: "pets", course: course_john_arnaud)
summary_3 = Summary.create!(title: "food", course: course_brice_pedro)
summary_4 = Summary.create!(title: "travels", course: course_brice_kate)
summary_5 = Summary.create!(title: "colors", course: course_brice_jerome)
summary_6 = Summary.create!(title: "geography", course: course_brice_jaime)
summary_7 = Summary.create!(title: "jobs", course: course_brice_juan)
summary_8 = Summary.create!(title: "weather", course: course_brice_michele)
summary_9 = Summary.create!(title: "pets", course: course_john_sophie)
summary_10 = Summary.create!(title: "food", course: course_john_sophie, status: "passed")
summary_11 = Summary.create!(title: "vehicles", course: course_john_francois)

puts "Summaries well generated"

puts "Generate Mistakes seeds"

mistake_1 = Mistake.create!(wrong_content: "car police" , correct_content: "police car" , status: "created", summary: summary_1)
mistake_2 = Mistake.create!(wrong_content: "the car red" , correct_content: "the red car" , status: "created", summary: summary_1)
mistake_3 = Mistake.create!(wrong_content: "truck delivery" , correct_content: "delivery truck" , status: "created", summary: summary_1)
mistake_4 = Mistake.create!(wrong_content: "a taxi yellow" , correct_content: "a yellow taxi" , status: "created", summary: summary_1)

mistake_5 = Mistake.create!(wrong_content: "the butterfly are flying" , correct_content: "the butterflies are flying" , status: "created", summary: summary_2)
mistake_6 = Mistake.create!(wrong_content: "the dog blue" , correct_content: "the blue dog" , status: "created", summary: summary_2)

mistake_7 = Mistake.create!(wrong_content: "fries french" , correct_content: "french fries" , status: "passed", summary: summary_3)

mistake_8 = Mistake.create!(wrong_content: "tower eiffel" , correct_content: "eiffel tower" , status: "failed", summary: summary_4)

mistake_9 = Mistake.create!(wrong_content: "yelow" , correct_content: "yellow" , status: "failed", summary: summary_5)

mistake_10 = Mistake.create!(wrong_content: "the ocean pacific" , correct_content: "the pacific ocean" , status: "failed", summary: summary_6)
mistake_11 = Mistake.create!(wrong_content: "valley of death" , correct_content: "death valley" , status: "failed", summary: summary_6)

mistake_12 = Mistake.create!(wrong_content: "haircutter" , correct_content: "hairdresser" , status: "failed", summary: summary_7)

mistake_13 = Mistake.create!(wrong_content: "tornad" , correct_content: "tornado" , status: "failed", summary: summary_8)

mistake_14 = Mistake.create!(wrong_content: "the butterfly are flying" , correct_content: "the butterflies are flying" , status: "created", summary: summary_9)
mistake_15 = Mistake.create!(wrong_content: "the dog blue" , correct_content: "the blue dog" , status: "created", summary: summary_9)

mistake_16 = Mistake.create!(wrong_content: "fries french" , correct_content: "french fries" , status: "passed", summary: summary_10)

puts "Mistakes well generated"

puts "Generate Words seeds"

word_1 = Word.create!(word: "car" , translation: "voiture" , status: "created", summary: summary_1)
word_2 = Word.create!(word: "boat" , translation: "bateau" , status: "created", summary: summary_1)
word_3 = Word.create!(word: "truck" , translation: "camion" , status: "created", summary: summary_1)

puts "Words well generated"
