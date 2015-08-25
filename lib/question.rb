class Question < ActiveRecord::Base
  belongs_to(:survey)
  validates(:description, {:presence => true})
  before_save(:capitalize_description)

private
  define_method(:capitalize_description) do
    self.description=(description().capitalize())
  end
end
