class Trie(T)
  getter :data

  def initialize
    @data = [] of T
    @children = Hash(Char, Trie(T)).new
  end

  def insert(str : String, data : T)
    if str.empty?
      @data.push(data)
    else
      c = str[0]
      @children[c] ||= Trie(T).new
      @children[c].insert(str[1..-1], data)
    end
  end

  def [](c : Char)
    @children[c]?
  end
end
