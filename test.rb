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
    crypto_message = cipher_text.join('')
    puts 'Zaszyfrowana wiadomość'
    puts crypto_message
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
    crypto_message = cipher_text.join('')
    p 'Zaszyfrowana wiadomość'
    p crypto_message
end

def permutational_block_cipher ()
    text_array = @plaintext.codepoints.to_a
    ln = text_array.length
    big_ar = ln/9 + 1
    cipher_text_blocks = Array.new(big_ar) {Array.new(3) {Array.new(3)}}
    iterator = 0
    p text_array
    for array_number in 0..1 do
        for i in 0..2 do
            for j in 0..2 do
                p text_array[iterator]
                cipher_text_blocks[array_number][i][j] = text_array[iterator]
                iterator += 1
            end
        end
    end
    p "Test ===================> "
    p cipher_text_blocks
    p "Dlugosc :"
    p cipher_text_blocks.length
    crypto_message = Array.new(ln)
    iterator = 0
    for nr in 0..1 do
        for i in 0..2 do
            for j in 0..2 do
                crypto_message[iterator] = cipher_text_blocks[nr][j][i]
                iterator +=1
            end
        end
    end
    p "Drugi test ===================> "
    p crypto_message
    p "Dlugosc :"
    p crypto_message.length
    k = 0
    message = Array.new(ln)
    crypto_message.each do |c|
        if c==nil
            k+=1
        else
            message[k] = c.chr
            k += 1
        end
    end
    crypto_message = message.join('')
    p 'Zaszyfrowana wiadomość'
    p crypto_message
end

puts 'Wybierz algorytm szyfrujący.'
puts '1-Szyfr Cezara'
puts '2-Szyfr afiniczny'
puts '3-Blokowy szyfr permutacyjny'

@cipher_id = gets.chomp

puts 'Podaj tekst do zaszyfrowania.'

@plaintext = gets.chomp

case @cipher_id
    when '1'
        cipher_by_Ceaser()
    when '2'
        affine_cipher()
    when '3'
        permutational_block_cipher()
    begin
        rescue => exception
    end
    else
        p 'Błąd wyboru'
    end