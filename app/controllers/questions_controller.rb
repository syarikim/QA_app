class QuestionsController < ApplicationController
  skip_before_action :login_required, only: [:index, :solved, :unsolved, :show]
  def index
    @q = Question.ransack(params[:q])
    @questions = @q.result(distinct: true).page(params[:page])
  end
  def solve
    question = Question.find(params[:question_id])
    question.update!(status: 1)
    redirect_to questions_url, notice: "質問 #{question.title}を解決済みにしました。"
  end

  def unsolved
    @q = Question.where(status: 0).ransack(params[:q])
    @questions = @q.result(distinct: true).page(params[:page])
  end

  def solved
    @q = Question.where(status: 1).ransack(params[:q])
    @questions = @q.result(distinct: true).page(params[:page])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user&.id
    @question.save!
    QuestionMailer.creation_email(@question, current_user).deliver_now
    redirect_to questions_url, notice: "質問 #{@question.title}を登録しました。"
  end

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: @question.id)
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    question = current_user.questions.find(params[:id])
    question.update!(question_params)
    redirect_to questions_url, notice: "質問「#{question.title}」を更新しました"
  end

  def destroy
    @question = current_user.questions.find(params[:id])
    @question.destroy
    redirect_to questions_url, notice: "質問「#{question.title}」を削除しました", status: :see_other
  end

  private
  def question_params
    params.require(:question).permit(:title, :detail)
  end
end
