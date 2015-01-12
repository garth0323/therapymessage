require 'test_helper'

class MessgeMailerTest < ActionMailer::TestCase
  test "mesage_created_notification" do
    mail = MessgeMailer.mesage_created_notification
    assert_equal "Mesage created notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
