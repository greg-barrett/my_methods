module Enumerable
  ###########################################################################
  def my_each
    i=0
    while i< self.length
      yield(self[i])
      i+=1
    end
   self
  end

###################################################################
  def my_each_with_index
    i=0
    while i< self.length
      yield(self[i], i)
      i+=1
    end
    self
  end
################################################################################
  def my_select
    selects=[]
    i=0
      while i< self.length
        if yield(self[i])
          selects<<self[i]
        end
        i+=1
      end
        if selects ==[]
           self
        else
           selects
          end
        end
################################################################################
  def my_all?
    selects =[]
    for i in 0..self.length-1
      if yield(self[i]) == false
        selects<<i
      end
    end
   selects ==[]?  true : false
  end
################################################################################
  def my_any?
    selects =[]
    for i in 0..self.length-1
      if yield(self[i]) == true
        selects<<i
      end
    end
    puts selects ==[]?  false :  true
  end

#################################################################################
  def my_none?# none are true/ all are false?
    selects =[]
    for i in 0..self.length-1
      if yield(self[i]) == true
        selects<<i
      end
    end
    puts selects ==[]?  true :  false
  end
##############################################################################
  def my_count?(matcher=nil)
    selects=0
    if block_given?
      for i in 0..self.length-1
        if yield(self[i])== true
          selects+=1
        end
      end
    else
        for i in 0..self.length-1
          if self[i] == matcher
            selects+=1
          end
        end
      end
      if selects == 0
        puts self.length
      else
      puts selects
    end
  end
#############################################################################
=begin
  def my_map
    result=[]
    if block_given?
      for i in 0..self.length-1
        result<<yield(self[i])
      end
      print result
    else
      print self
    end
  end
=end
def my_map(&double)
  result=[]
  if  block_given?
    for i in 0..self.length-1
      result<<yield(self[i])
    end
    print result
  elsif double
    for i in 0..self.length-1
      result<<double.call(self[i])
    end
    print result
  else
    print self
  end
end
double=Proc.new {|num| num*2}
#############################################################################
  def my_inject
    x=self[0]
    if block_given?
      for i in 1..self.length-1
        x= yield(x, self[i])
      end
      puts x

    end
  end
#############################################################################
  def my_multiply
    self.my_inject {|sum, num| sum * num}
  end
#############################################################################

  def array_sum(opperand)
    if opperand == :plus
    self.my_inject {|sum, num| sum + num}
  elsif opperand == :minus
    self.my_inject {|sum, num| sum - num}
  elsif opperand == :divide
    self.my_inject {|sum, num| sum / num}
  elsif opperand == :multiply
    self.my_inject {|sum, num| sum * num}
  else
    puts "Arguments can be :plus, :minus, :divide or :multiply"
  end
  end
#############################################################################
end

def my_multiply(array)
  array.my_inject {|sum, num| sum * num}
end



#array.my_each_with_index do |place, index|
#   puts "The index is #{index} and the item is #{place}."
# end
