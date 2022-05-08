class Admin::QuestionsController < ApplicationController
  layout 'admin_header'
  def index
    @questions = Question.all
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy!
    redirect_to admin_questions_index_path, notice: "「#{question.title}」を削除しました", status: :see_other
  end
end
