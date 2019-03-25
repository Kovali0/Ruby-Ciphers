class Caesar
    def encrypt_by_Caesar (plaintext)
        puts 'Enter the encryption key.'
        ceaserkey = gets.chomp.to_i
        text_array = plaintext.codepoints.to_a
        ln = text_array.length
        cipher_text = Array.new(ln)
        i = 0
        text_array.each do |c|
            case c
                when 'z'
                    c = 'a'
                when 'Z'
                    c = 'A'
                when ' '
                    c = ' ' #= '_' - optional
                when '.'
                    c = '.'
                else
                    c += ceaserkey
                end
            cipher_text[i] = c.chr
            i += 1
        end
        crypto_message = cipher_text.join('')
        puts 'Your message was encrypted.'
        return crypto_message
    end
end