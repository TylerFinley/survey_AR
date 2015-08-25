class Survey < ActiveRecord::Base
  has_many(:question)
  validates(:name, :presence => true)
  before_save(:capitalize_name)


private

  define_method(:capitalize_name) do
    name = self.name().split()
    name.each() do |word|
      word.capitalize!()
    end
    self.name = name.join(" ")
  end

end
