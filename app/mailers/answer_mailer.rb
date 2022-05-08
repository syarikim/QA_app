class AnswerMailer < ApplicationMailer
  def creation_email(answer, current_user)
    to_mail = []
    answer.question.answers.each do |answer|
      to_mail.append(answer.user.email)
    end
    to_mail = to_mail.uniq
    to_mail.delete(current_user.email)
    mail(
      subject: '回答作成完了メール',
      to: to_mail,
      from: 'questionleaf@example.com'
    )
  end
end