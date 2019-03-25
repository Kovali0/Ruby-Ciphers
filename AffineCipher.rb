class AffineCipher
    def affine_cipher (plaintext)
        #dependence of calculation on the formula: Y=(Ax+B)mod(N)
        text_array = plaintext.codepoints.to_a
        ln = text_array.length
        cipher_text = Array.new(ln)
        alphabet_number = 26 #Number of elements in English alphabet
        puts 'Enter formula key. (Two number parameters)'
        puts 'Defoult keys are 3 and 11.'
        a = gets.chomp.to_i
        b = gets.chomp.to_i
        if a==0
            a = 3
        end
        if b==0
            b = 11
        end
        i = 0
        text_array.each do |c|
            y = (a*(c-97)+b)%alphabet_number
            cipher_text[i] = (y + 97).chr
            i += 1
        end
        crypto_message = cipher_text.join('')
        puts 'Your message was encrypted.'
        return crypto_message
    end
end