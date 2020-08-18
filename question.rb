class Question
  attr_accessor :answer

  def initialize
    @first_num = rand(1..20)
    @second_num = rand(1..20)
  end
  
  def to_string
    "What is #{@first_num} + #{@second_num} ?"
  end
  
  def is_right(user_input)
    self.answer = @first_num + @second_num
    if user_input == self.answer
      return true
    else
      return false
    end
  end

end
