watch ["calc"] do |t|
  p t
  next unless t.size == 4
  _,op,a,b = t
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
  t.push result
  write t
end
