watch ["calc"] do |tuple|
  p tuple
  next unless tuple.size == 4
  _,op,a,b = tuple
  result =
    case op
    when "*"
      a.to_i * b.to_i
    when "/"
      a.to_i / b.to_i
    when "-"
      a.to_i - b.to_i
    when "+"
      a.to_i + b.to_i
    end
  tuple.push result
  write tuple
end
