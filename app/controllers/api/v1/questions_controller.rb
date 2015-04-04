class Api::V1::QuestionsController < ApplicationController

  respond_to :json

  def index
    category = Category.find_by_id!(params[:category_id])
    @questions = category.questions
    render_object(@questions, 200)
  end

  def show
    @question = Question.find_by_id!(params[:id])
    render_object(@question, 200)
  end

  def create
    # TODO: Qualatative and Quantatative.
    category = Category.find_by_id!(params[:category_id])
    @question = Question.create!( category_id: category.id,
                                qual: true,
                                quant: true,
                                text: params[:text],
                                impact: params[:impact])
    render_object(@question, 201)
    # Create responses somehow for collaborators?
  end

  def destroy 
    question = Question.find_by_id!(params[:id])
    current_category = question.category
    @next_question = Question.find_next_question_and_delete(current_category.questions, question.id)
    render_object(@next_question, 200)
  end

  def update
    @question = Question.find_by_id!(params[:id])
    @question.update_attributes!(text: params[:text])
    render_object(@question, 200)
  end

  def reorder
    category = Category.find_by_id!(params[:category_id])
    questions = category.questions
    question = questions.find_by_position!(params[:start].to_i)
    question.insert_at(params[:end].to_i)
    render_204
    # @new_questions = category.questions
    # render_object(@new_questions, 200)
  end

  def add_component
    type = params[:type]
    question = Question.find_by_id!(params[:id])
    @component = question.add_component(type)
    render_object(@component, 200)
  end

  def comment
    
    Comment.create(text: params[:comment][:text], user_id: current_user.id, question_id: get_current_question.id)

    render :nothing=>true

  end

end
