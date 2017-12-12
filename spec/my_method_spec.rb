require 'my_methods.rb'

describe Enumerable do
  describe "my_each" do
    context "given an aray and a block" do
      it "returns array of each digit affected by the block" do
        yielded=[]
        [1, 2, 3].my_each { |x| yielded<<x+=1}
        expect(yielded).to eql([2, 3, 4])
      end
    end

    context "empty array" do
     it "will output '[]' " do

      expect([].my_each { |x| x }).to eql([])
    end
  end
  end

 describe ".my_all" do
   context "if array values are less than a given value" do
     it "returns true" do
       expect([1, 2, 3].my_all? { |x| x < 4}).to eql(true)
     end
   end
 end

   describe ".my_select" do
     context "if block returns true for a value in an array" do
       it "returns the values for which block was true" do
         expect([1, 8, 10, 5, 800].my_select{ |x| x<9}).to eql([1, 8, 5])
       end
     end

     context "if block returns false for a value in an array" do
       it "returns self" do
         expect([1, 8, 10, 5, 800].my_select{ |x| x>900}).to eql([1, 8, 10, 5, 800])
       end
     end
   end


end
