class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"

  def index
    # This is a comment
    "index"
  end
end
