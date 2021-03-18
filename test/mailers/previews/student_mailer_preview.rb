# Preview all emails at http://localhost:3000/rails/mailers/student_mailer
class StudentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/student_mailer/welcome
  def sending_summary
    student = Student.last
    summary = Summary.last
    StudentMailer.sending_summary(student, summary)
  end

  def create_confirmation
    student = Student.first
    StudentMailer.welcome(student)
  end

end
