# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning Database"
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
john.photo.attach(io: file, filename: 'brice.jpg', content_type: 'image/jpg')
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
puts "Students well generated"

puts "Generate Course seeds"

course_john_sophie = Course.create!(teacher: john, student: sophie, class_language: "EN")
course_john_arnaud = Course.create!(teacher: john, student: arnaud, class_language: "EN")
course_brice_pedro = Course.create!(teacher: brice, student: pedro, class_language: "EN")
course_brice_kate = Course.create!(teacher: brice, student: kate, class_language: "EN")
course_brice_jerome = Course.create!(teacher: brice, student: jerome, class_language: "EN")
course_brice_jaime = Course.create!(teacher: brice, student: jaime, class_language: "EN")
course_brice_juan= Course.create!(teacher: brice, student: juan, class_language: "EN")
course_brice_michele = Course.create!(teacher: brice, student: michele, class_language: "EN")
puts "Courses well generated"

puts "Generate Summaries seeds"

summary_1 = Summary.create!(title: "vehicles", course: course_john_sophie, sent: false)
summary_2 = Summary.create!(title: "pets", course: course_john_arnaud, sent: false)
summary_3 = Summary.create!(title: "food", course: course_brice_pedro, sent: false)
summary_4 = Summary.create!(title: "travels", course: course_brice_kate, sent: false)
summary_5 = Summary.create!(title: "colors", course: course_brice_jerome, sent: false)
summary_6 = Summary.create!(title: "geography", course: course_brice_jaime, sent: false)
summary_7 = Summary.create!(title: "jobs", course: course_brice_juan, sent: false)
summary_8 = Summary.create!(title: "weather", course: course_brice_michele, sent: false)
puts "Summaries well generated"

puts "Generate Mistakes seeds"

mistake_1 = Mistake.create!(wrong_content: "a truc" , correct_content: "a truk" , status: "created", summary: summary_1)
mistake_2 = Mistake.create!(wrong_content: "the dog red" , correct_content: "the red dog" , status: "created", summary: summary_2)
mistake_3 = Mistake.create!(wrong_content: "the fish big" , correct_content: "the big fish" , status: "created", summary: summary_3)
mistake_4 = Mistake.create!(wrong_content: "the tower eiffel" , correct_content: "the eiffel tower" , status: "created", summary: summary_4)
mistake_5 = Mistake.create!(wrong_content: "yello" , correct_content: "yellow" , status: "created", summary: summary_5)
mistake_6 = Mistake.create!(wrong_content: "valley of death" , correct_content: "death valley" , status: "passed", summary: summary_6)
mistake_7 = Mistake.create!(wrong_content: "doctor" , correct_content: "physician" , status: "passed", summary: summary_7)
mistake_8 = Mistake.create!(wrong_content: "tornad" , correct_content: "tornado" , status: "failed", summary: summary_8)
puts "Mistakes well generated"