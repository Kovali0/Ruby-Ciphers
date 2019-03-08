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

def affine_cipher ()
    #dependence of calculation on the formula: Y=(Ax+B)mod(N)
    text_array = @plaintext.codepoints.to_a
    ln = text_array.length
    cipher_text = Array.new(ln)
    alphabet_number = 26 #Number of elements in English alphabet
    a = 3 
    b = 11
    i = 0
    text_array.each do |c|
        y = (a*(c-97)+b)%alphabet_number
        cipher_text[i] = (y + 97).chr
        i += 1
    end
    p 'Zaszyfrowany'
    p cipher_text
end

puts 'Wybierz algorytm szyfrujący.'
puts '1-Szyfr Cezara'
p '2-Szyfr afiniczny'

@cipher_id = gets.chomp

puts 'Podaj tekst do zaszyfrowania.'

@plaintext = gets.chomp

case @cipher_id
    when '1'
        cipher_by_Ceaser()
    when '2'
        affine_cipher()
    begin
        rescue => exception
    end
    else
        p 'Błąd wyboru'
    end