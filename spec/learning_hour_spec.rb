require 'learning_hour'

describe "math" do
  it "evaluates a single number" do
    Number.new(5).evaluate.should be 5
  end

  describe "addition" do
    it "evaluates addition of two numbers" do
      Add.new(
        Number.new(3),
        Number.new(4)).evaluate.should be 7
    end

    it "evaluates addition of two entities" do
      Add.new(
        Add.new(
          Number.new(1),
          Number.new(2)),
          Number.new(4)).evaluate.should be 7
    end
  end

  describe "subtraction" do
    it "evaluates subtraction of two numbers" do
      Subtract.new(
        Number.new(3),
        Number.new(2)).evaluate.should be 1
    end

    it "evaluates subtraction of two entities" do
      Subtract.new(
        (Add.new(
          Number.new(4),
          Number.new(5))),
        Number.new(2)).evaluate.should be 7
    end
  end

  describe "division" do
    it "evaluates division of two numbers" do
      Divide.new(
        Number.new(10),
        Number.new(5)).evaluate.should be 2
    end
  end

  describe "parsing" do
    it "parses a number" do
      parse_number("5").first.should == Number.new(5)
    end

    it "parses an open paren" do
      parse_open_paren("(+ 1 2)").first.should == '('
      parse_open_paren("(+ 1 2)")[1].should == '+ 1 2)'
    end

    it "parses an closed paren" do
      parse_close_paren(")").first.should == ')'
    end

    it "parses a space" do
      parse_space(" 1 2)").first.should == ' '
      parse_space(" 1 2)")[1].should == '1 2)'
    end

    it "parses a plus" do
      parse_plus("+ 1 2)").first.should == '+'
      parse_plus("+ 1 2)")[1].should == ' 1 2)'
    end

    it "parses an expression" do
      parse("(+ 1 2)").first.should == Add.new(
                                         Number.new(1),
                                         Number.new(2))
    end
  end
end

