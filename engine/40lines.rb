def match_one(pattern, text)
  return false if text.empty?
  pattern == text || pattern == '.' || pattern.empty?
end

def match(pattern, text)
  return true if pattern.empty?
  return true if pattern == '$' && text.empty?
  match_one(pattern[0], text[0]) && match(pattern[1..-1], text[1..-1])
end

def search(pattern, text)
  return match(pattern[1..-1], text) if pattern[0] == '^'
  text.each_char.with_index.any? { |_, i| match(pattern, text[i..-1]) }
end
