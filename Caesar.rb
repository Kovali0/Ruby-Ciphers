class Caesar
    def encrypt_by_Caesar (plaintext)
        puts 'Podaj klucz szyfrujący.'
        ceaserkey = gets.chomp.to_i
        #@plaintext.each_byte do |c|
        #    c += c
        text_array = plaintext.codepoints.to_a
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
        return crypto_message
    end
end