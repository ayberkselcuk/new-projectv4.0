# frozen_string_literal: true

# QuestionsController
class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show edit update destroy]

  def index
    @questions = Question.all.order('created_at DESC')
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    @question.destroy
    redirect_to root_path
  end

  def new
    if user_signed_in?
      @question = current_user.questions.build
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @question = current_user.questions.build(question_params)
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def show; end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
