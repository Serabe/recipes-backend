class Step < ActiveRecord::Base

  belongs_to :recipe

  validates :instruction,
            presence: true,
            length: { minimum: 5 }

  validates :position,
            presence: true,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: 0}


  def active_model_serializer
    if self.valid?
      ::ShowStepSerializer
    else
      ::ErrorStepSerializer
    end
  end
end
