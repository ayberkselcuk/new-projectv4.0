class QuestionsController < ApplicationController
  
  before_action :find_question, only: [:show, :edit, :update, :destroy]


  def index
  	@questions = Question.all.order("created_at DESC")
  end

  def edit
  end
  
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
  	@question = Question.new
  end

 def create
    @question = Question.new(question_params) 

    if @question.save
      redirect_to @question
    else
      render :new
    end
 end
  
  def show
  end

 private

  def question_params
  	params.require(:question).permit(:title, :content)
  end

  def find_question
 	 @question = Question.find(params[:id])
  end
 end
