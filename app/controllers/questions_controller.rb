class QuestionsController < ApplicationController

  def create
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.create(params[:question])
    redirect_to edit_survey_path
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(params[:question])
    redirect_to edit_survey_path(:id => @question.survey_id)
  end

end
