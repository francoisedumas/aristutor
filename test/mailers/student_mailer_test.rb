require 'test_helper'

class StudentMailerTest < ActionMailer::TestCase
  test "welcome" do
    mail = StudentMailer.create_confirmation
    assert_equal "Welcome", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "summary" do
    mail = StudentMailer.sending_summary
    assert_equal "Welcome", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
