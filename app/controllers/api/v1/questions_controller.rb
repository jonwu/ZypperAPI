class Api::V1::QuestionsController < ApplicationController

  respond_to :json

  def index

  end

  def show

  end

  def create
    # TODO: Qualatative and Quantatative.
    category = Category.find_by_id!(params[:category_id])
    @question = Question.create!( category_id: category.id,
                                qual: true,
                                quant: true,
                                text: params[:text],
                                impact: params[:impact].strip)
    render_object(@question, 201)
    # Create responses somehow for collaborators?
  end

  def destroy 
    question = Question.find_by_id!(params[:id])
    Question.destroy(question.id)
    render_json_delete
  end

  def update
    get_current_question.update_attributes!(text: params[:question][:text])
  end

  def comment
    
    Comment.create(text: params[:comment][:text], user_id: current_user.id, question_id: get_current_question.id)

    render :nothing=>true

  end

end
