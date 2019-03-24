class PBCipher
    def permutational_block_cipher (plaintext)
        text_array = plaintext.codepoints.to_a
        ln = text_array.length
        big_ar = ln/9+1
        cipher_text_blocks = Array.new(big_ar) {Array.new(3) {Array.new(3)}}
        iterator = 0
        for array_number in 0..big_ar do
            for i in 0..2 do
                for j in 0..2 do
                    if text_array[iterator]!=nil
                        cipher_text_blocks[array_number][i][j] = text_array[iterator]
                        iterator += 1
                    end
                end
            end
        end
        crypto_message = Array.new(ln)
        iterator = 0
        for nr in 0..big_ar do
            for i in 0..2 do
                for j in 0..2 do
                    if iterator < ln
                        crypto_message[iterator] = cipher_text_blocks[nr][j][i]
                        iterator +=1
                    end
                end
            end
        end
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
        p 'Zaszyfrowana wiadomosc'
        p crypto_message
        return crypto_message
    end
end