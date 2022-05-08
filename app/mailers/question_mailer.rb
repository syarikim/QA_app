class QuestionMailer < ApplicationMailer
  def creation_email(question, current_user)
    @question = question
    to_mail = User.all.pluck(:email)
    to_mail.delete(current_user.email)
    mail(
      subject: '質問作成完了メール',
      to: to_mail,
      from: 'questionleaf@example.com'
    )
  end
end
