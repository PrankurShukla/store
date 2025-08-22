require "test_helper"

class ProductMailerTest < ActionMailer::TestCase
  test "in_stock" do
    product = products(:tshirt)
    subscriber = subscribers(:david)

    mail = ProductMailer.with(product: product, subscriber: subscriber).in_stock

    # Make sure these match your actual mailer values
    assert_equal "#{product.name} is back in stock!", mail.subject
    assert_equal [ subscriber.email ], mail.to
    assert_equal [ "no-reply@yourdomain.com" ], mail.from  # Update this to match your mailer default

    assert_match "Good news!", mail.body.encoded
    assert_match product.name, mail.body.encoded
  end
end
