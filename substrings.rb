def substrings(text, dictionary)
  substrings = {}
  dictionary.each { |substr| substrings[substr] = text.scan(/#{Regexp.escape(substr)}/i).length if text.downcase.include?(substr.downcase) }
  substrings
end

text = "Howdy, and how are you? My name is Margot, and I'm feeling below the weather today. However, I'm looking forward to below-average temperatures tomorrow. The quick brown fox jumps over the lazy dog. Below the surface, there's a whole other world. How wonderful!"

dictionary = ["below", "down", "go", "going", "how", "howdy", "jump", "jumps", "look", "looking", "other", "over", "the", "weather", "wonder", "wonderful", "world", "you"]

p substrings(text, dictionary)