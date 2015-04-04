class Component < ActiveRecord::Base
  belongs_to :componentable, polymorphic: true
  has_one :text_component
  after_create :create_sub_component

  def get_component
    case self.title
    when "text"
      return self.text_component
    else

    end
  end

  private

    def create_sub_component
      case self.title
      when "text"
        TextComponent.create!(text: "", component: self)
      else
        
      end
    end
end

