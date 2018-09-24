r = ARGV[0]
s = ARGV[1]

res = []

# 文字を検索するだけ
class R1
  def self.engine(r, s)
    return nil if r.empty?
    s.index(r)
  end
end
# res << s if R1.engine(r, s)

# a* に対応
class R2 < R1
  def self.engine(r, s)
    lr, rr = r.split('*')
    return nil if lr.nil?
    if super(lr, s) || super(lr[0..-2], s)
      return true if rr.nil?
      sdup = s.dup
      sdup.slice!(0, s.index(lr[0..-2]) + 1)
      super(rr, sdup)
    end
  end
end
# res << s if R2.engine(r, s)

# a|b に対応
class R3 < R2
  def self.engine(r, s)
    lr, rr = r.split('|')
    return super if rr.nil?
    super(lr, s) || super(rr, s)
  end
end
res << s if R3.engine(r, s)

# マッチしていれば出力
puts res.uniq
