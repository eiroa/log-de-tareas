class FormatTester 
  
  def self.is_alp_num(some_text)
    return /[[:alnum:]]/.match(some_text)      
  end  
  
end