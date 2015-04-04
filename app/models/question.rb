class Question < ActiveRecord::Base
	belongs_to :category
	has_many :responses, dependent: :destroy
	has_many :submissions, dependent: :destroy
	has_many :comments, dependent: :destroy

  # components
  has_many :components, dependent: :destroy, as: :componentable

  acts_as_list scope: :category

  # default_scope { order('created_at ASC') } 
  after_initialize :init

  def init
    self.impact  ||= "normal"
  end

  def self.find_next_question_and_delete(questions, current_question_id)
    ret = nil
    if questions.count > 1
      ret = Question.where("id < " + current_question_id.to_s).last
      if ret == nil
        ret = Question.where("id > " + current_question_id.to_s).first
      end
    end
    Question.destroy(current_question_id)
    return ret
  end

  def add_component(type)
    return Component.create!(title: type, componentable: self)
  end
end
