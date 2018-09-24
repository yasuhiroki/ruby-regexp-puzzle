def match_one(pattern, text)
  return false if text.empty?
  pattern == text || pattern == '.' || pattern.empty?
end

def match(pattern, text)
  return true if pattern.empty?
  match_one(pattern[0], text[0]) && match(pattern[1..-1], text[1..-1])
end
