
class Number
  attr_accessor :value

  def initialize(value)
    self.value = value
  end

  def evaluate
    value
  end

  def ==(other)
    other.kind_of?(Number) and value == other.value
  end
end

class Add
  attr_accessor :left, :right

  def initialize(left, right)
    self.left, self.right = left, right
  end

  def evaluate
    left.evaluate + right.evaluate
  end
end

class Subtract
  attr_accessor :left, :right

  def initialize(left, right)
    self.left, self.right = left, right
  end

  def evaluate
    left.evaluate - right.evaluate
  end
end

class Divide
  attr_accessor :left, :right

  def initialize(left, right)
    self.left, self.right = left, right
  end

  def evaluate
    left.evaluate / right.evaluate
  end
end

def parse_number(string)
  [Number.new(string.to_i), rest_of(string)]
end

def parse(string)
  null_value = [nil, string]

  remaining = parse_open_paren string
  return null_value if remaining.first.nil?

  parse_plus remaining
  return null_value if remaining.first.nil?

  parse_space remaining
  return null_value if remaining.first.nil?

  parse remaining
  return null_value if remaining.first.nil?

  parse_space remaining
  return null_value if remaining.first.nil?

  parse remaining
  return null_value if remaining.first.nil?

  parse_close_paren remaining

  return [
end

def parse_open_paren(string)
  if string[0] == '('
    ['(', rest_of(string)]
  else
    [nil, string]
  end
end

def parse_close_paren(string)
  if string[0] == ')'
    [')', rest_of(string)]
  else
    [nil, string]
  end
end

def parse_space(string)
  if string[0] == ' '
    [' ', rest_of(string)]
  else
    [nil, string]
  end
end

def parse_plus(string)
  if string[0] == '+'
    ['+', rest_of(string)]
  else
    [nil, string]
  end
end

def rest_of(string)
  string[1..-1]
end
