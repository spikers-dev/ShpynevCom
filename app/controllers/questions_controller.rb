class QuestionsController < ApplicationController
  before_action :set_question, only: [:update, :show, :destroy, :edit]

  def index
    @question = Question.new
    @questions = Question.all
  end

  def show; end

  def new
    @question = Question.new
  end

  def create
    question = Question.create(question_params)

    redirect_to(question_path(question), notice: 'Новый вопрос создан!')
  end

  def edit; end

  def update
    @question.update(question_params)

    redirect_to(question_path(@question), notice: 'Вопрос отредактирован!')
  end

  def destroy
    @question.destroy

    redirect_to(questions_path, notice: 'Вопрос удалён!')
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
