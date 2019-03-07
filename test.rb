def cipher_by_Ceaser ()
    puts 'Podaj klucz szyfrujący.'
    ceaserkey = gets.chomp.to_i
    #@plaintext.each_byte do |c|
    #    c += c
    text_array = @plaintext.codepoints.to_a
    ln = text_array.length
    cipher_text = Array.new(ln)
    i = 0
    text_array.each do |c|
        c += ceaserkey
        cipher_text[i] = c.chr
        i += 1
    end
    puts 'Zaszyfrowany'
    puts cipher_text
end

puts 'Wybierz algorytm szyfrujący.'
puts '1-Szyfr Cezara'

@cipher_id = gets.chomp

puts 'Podaj tekst do zaszyfrowania.'

@plaintext = gets.chomp

case @cipher_id
when '1'
    cipher_by_Ceaser()
begin
rescue => exception
end
    
else
    
end