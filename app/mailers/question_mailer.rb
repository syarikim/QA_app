class QuestionMailer < ApplicationMailer
  def creation_email(question)
    @question = question
    mail(
      subject: '質問作成完了メール',
      to: 'user@exaple.com',
      from: 'questionleaf@example.com'
    )
  end
end
