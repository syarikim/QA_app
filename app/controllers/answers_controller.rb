class AnswersController < ApplicationController
  def create
    Answer.create!(detail: answer_params[:detail], question_id: params[:question_id], user_id: 17)
    redirect_to question_url(params[:question_id]), notice: "回答を追加しました"
  end

  def destroy
    Answer.find(params[:question_id]).destroy!
    redirect_to question_url(params[:question_id]), notice: "回答を削除しました"
  end

  private
  def answer_params
    params.require(:answer).permit(:detail, :question_id)
  end
end