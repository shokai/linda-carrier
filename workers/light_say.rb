# -*- coding: utf-8 -*-
watch ["sensor", "light"] do |t|
  p t
  next unless t.size == 3
  _,_,light = t
  light = light.to_i
  if light > 100
    write ["say", "あかるい"]
  else
    write ["say", "くらい"]
  end
end
