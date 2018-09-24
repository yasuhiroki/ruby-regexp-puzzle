def match_one(pattern, text)
  return false if text.empty?
  pattern == text || pattern == '.' || pattern.empty?
end
