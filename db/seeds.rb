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

brice = Teacher.create!(first_name: "Brice", last_name: "Nice", email: "brice@lewagon.com", password: "azerty", about: "French teacher, 4 years of experience")
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

kate = Student.create!(first_name: "Kate", last_name: "Smith", phone_number: "+44642424242", mother_language: "EN", email: "kate@lewagon.com", password: "azerty")
file = File.open(Rails.root.join('db/seeds/student_images/kate.jpg'))
kate.photo.attach(io: file, filename: 'kate.jpg', content_type: 'image/jpg')
kate.save!

james = Student.create!(first_name: "James", last_name: "Mcavoy", phone_number: "+44742424242", mother_language: "EN", email: "james@lewagon.com", password: "azerty")
file = File.open(Rails.root.join('db/seeds/student_images/james.jpg'))
james.photo.attach(io: file, filename: 'james.jpg', content_type: 'image/jpg')
james.save!

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
course_brice_pedro = Course.create!(teacher: brice, student: pedro, class_language: "FR")
course_brice_kate = Course.create!(teacher: brice, student: kate, class_language: "FR")
course_brice_james = Course.create!(teacher: brice, student: james, class_language: "FR")
course_brice_jaime = Course.create!(teacher: brice, student: jaime, class_language: "FR")
course_brice_juan= Course.create!(teacher: brice, student: juan, class_language: "FR")
course_brice_michele = Course.create!(teacher: brice, student: michele, class_language: "FR")
puts "Courses well generated"
