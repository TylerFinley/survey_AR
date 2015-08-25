class Survey < ActiveRecord::Base
  has_many(:question)
  validates(:name, {:presence => true})
  before_save(:capitalize_name)


private

  define_method(:capitalize_name) do
    # self.name=(name().split().capitalize().join(" "))
    split_name = self.name().split()

    split_name.each() do |word|
      word.capitalize()
    end
    split_name.join(" ")
  end
end
