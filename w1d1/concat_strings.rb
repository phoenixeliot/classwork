def concat_strings(array)
  array.reduce(&:+)
end

p concat_strings(["Yay ", "for ", "strings!"])