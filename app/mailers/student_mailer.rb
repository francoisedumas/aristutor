class StudentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.student_mailer.welcome.subject
  #
  def create_confirmation(student)
    @student = student

    mail(
      to:       @student.email,
      subject:  "Welcome #{@student.first_name} to Aristutor!"
    )
  end

  def sending_summary(student, summary)
    @student = student
    @summary = summary

    mail(
      to:       @student.email,
      subject:  "You received a new summary!"
    )
  end
end
