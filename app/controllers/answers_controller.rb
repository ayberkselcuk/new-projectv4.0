# frozen_string_literal: true

# AnswersController
class AnswersController < ApplicationController
 def create
   @question = Question.find(params[:question_id])
   @answer = @question.answers.build(params[:answer].permit(:content))
   @answer.user = current_user
if @answer.save
   redirect_to question_path(@question)
  else
   redirect_to back
  end
 end
end
