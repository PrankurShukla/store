class ProductMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.product_mailer.in_stock.subject
  #
  def in_stock
    @product = params[:product]
    @subscriber = params[:subscriber]
    mail to: @subscriber.email, subject: I18n.t("product_mailer.in_stock.subject", product: @product.name)
  end
end
