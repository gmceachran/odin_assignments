# Encode Letters:
def encode_letters(letters, alphabet, arg)

  letter_indeces = letters.map do |letter|
    if alphabet.include?(letter)
      alphabet.index(letter)
    end
  end

  encoded_indeces = letter_indeces.map do |number|
    index = number + arg
    index -= 26 if index > 25
    index
  end

  encoded_arr = encoded_indeces.map do |integer|
    alphabet[integer]
  end

  encoded_arr
end

# Synthesis:
def caesar_cipher(string, arg)
  alphabet = ('a'..'z').to_a
  string_arr = string.split('')

  letters = []
  capitalized = []
  other_characters = []

  string_arr.each_with_index do |character, index|

    if character.match?(/[A-Z]/)
      character.downcase!
      letters.push(character)
      capitalized.push(true)
    elsif character.match?(/[a-z]/)
      letters.push(character)
      capitalized.push(false)
    else
      other_characters.push({ character => index })
    end
  
  end

  encoded_letters = encode_letters(letters, alphabet, arg)

  reconstructed = capitalized.map.with_index do |boolean, index|
    boolean ? encoded_letters[index].upcase : encoded_letters[index]
  end

  other_characters.each do |character_hash|
    character, index = character_hash.first
    reconstructed.insert(index, character)
  end

  encoded_string = reconstructed.join
  encoded_string
end

# obtain and check validity of inputs
def validate_inputs

  puts "Please enter the text you would like to encode:"
  string = gets.chomp

  while string.match?(/\d/) do 
    puts "Numbers are not allowed. Please enter text only."
    string = gets.chomp
  end

  puts "Please enter the shift value:"
  shift_input = gets.chomp

  while shift_input.match?(/\D/) || shift_input.to_i > 25 do 
    if shift_input.match?(/\D/)
      puts "Invalid input: please enter a number for the shift value."
      shift_input = gets.chomp
    elsif shift_input.to_i > 25
      puts "Shift input cannot be greater than 25"
      shift_input = gets.chomp
    end
  end

  argument = shift_input.to_i

  encoded_string = caesar_cipher(string, argument)
  puts "The encoded form of \"#{string}\" with a shift of #{argument} is \"#{encoded_string}\"."

end

validate_inputs