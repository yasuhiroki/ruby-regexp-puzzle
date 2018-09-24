def match_one(pattern, text)
  return false if text.empty?
  pattern == text || pattern == '.' || pattern.empty?
end

def match(pattern, text)
  return true if pattern.empty?
  return true if pattern == '$' && text.empty?
  return false if text.empty?
  return match_question(pattern, text) if pattern[1] == '?'
  return match_star(pattern, text)     if pattern[1] == '*'
  match_one(pattern[0], text[0]) && match(pattern[1..-1], text[1..-1])
end

def match_question(pattern, text)
  match(pattern[2..-1], text) ||
    (match_one(pattern[0], text[0]) && match(pattern[2..-1], text[1..-1]))
end

def match_star(pattern, text)
  match(pattern[2..-1], text) ||
    (match_one(pattern[0], text[0]) && match(pattern, text[1..-1]))
end

def search(pattern, text)
  return match(pattern[1..-1], text) if pattern[0] == '^'
  match(".*#{pattern}", text)
end
