module RegexpM17N
  def self.non_empty?(str)
    str.force_encoding('binary') =~ /^.+$/
  end
end
