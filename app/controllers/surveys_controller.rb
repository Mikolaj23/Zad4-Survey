class SurveysController < ApplicationController

  before_filter :user_signed, :only => [:new, :create]
  before_filter :authorise, :only => [:update, :edit]

  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def edit
    @survey = Survey.find(params[:id])
    redirect_to new_user_session_path unless user_signed_in?
    @new_question = @survey.questions.new
    @question_types = QuestionType.all
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(params[:survey])
      redirect_to @survey
    else
      render :action => 'edit'
    end
  end

  def new
    @survey = Survey.new
  end

  def create
    @user = User.find(current_user.id)
    @user.surveys.create(params[:survey])
    redirect_to root_path
  end

  private
    def authorise
      @survey = Survey.find(params[:id])
      redirect_to surveys_path unless current_user.id == @survey.user_id
    end

    def user_signed
      redirect_to new_user_session_path unless user_signed_in?
    end
end
