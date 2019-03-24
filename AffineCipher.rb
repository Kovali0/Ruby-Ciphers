class AffineCipher
    def affine_cipher (plaintext)
        #dependence of calculation on the formula: Y=(Ax+B)mod(N)
        text_array = plaintext.codepoints.to_a
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
        return crypto_message
    end
end