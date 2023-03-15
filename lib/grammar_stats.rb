class GrammarStats
  def initialize
    @wrong, @right = 0, 0
  end

  def check(text)
   fail "Invalid input" unless text.is_a? String and text != ""
   if text[-1] != "." or text[0] == text[0].downcase
    @wrong += 1
    return false
   end
   @right += 1
   return true
  end

  def percentage_good
    fail "Nothing has been checked yet!" if @wrong + @right == 0
    ((@right / (@right + @wrong).to_f)*100).round
  end
end