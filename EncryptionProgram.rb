class Program
    require_relative 'Caesar'
    require_relative 'AffineCipher'
    require_relative 'PBCipher'

    w = 1
    while w==1 do

        puts 'Welcom. What do you want to do?'
        puts '1-Encryption'
        puts '2-Decryption'

        operation = gets.chomp

        if operation == '1'

            puts 'Choose the encryption method from below:'
            puts '1-Caesar cipher'
            puts '2-Affine cipher'
            puts '3-Permutational block cipher'

            cipher_id = gets.chomp

            war = 1;
            while war==1 do
                puts 'Enter the file name which do you want to encrypt. (Remember that file have to have .txt extension)'
                filename = gets.chomp
                if filename.end_with?(".txt") && File.file?(filename)
                    war = 0
                else
                    puts 'Your file doesn t exist or you made mistake in entered filename. Try again.'
                end
            end

            file = File.open(filename, "rb")
            plaintext = file.read

            case cipher_id
                when '1'
                    @caesar = Caesar.new()
                    content = @caesar.encrypt_by_Caesar(plaintext)
                when '2'
                    @ac = AffineCipher.new()
                    content = @ac.affine_cipher(plaintext)
                when '3'
                    @pbc = PBCipher.new()
                    content  = @pbc.permutational_block_cipher(plaintext)
                begin
                    rescue => exception
                end
                else
                    p 'Błąd wyboru'
            end

            filename = "encrypted" + filename
            file = File.open(filename, "a") 
            file.puts content
            w = 0

        elsif operation == '2'

            puts 'Choose the cipher to decryption from below:'
            puts '1-Caesar cipher'

            cipher_id = gets.chomp

            war = 1;
            while war==1 do
                puts 'Enter the file name which do you want to decrypt. (Remember that file have to have .txt extension)'
                filename = gets.chomp
                if filename.end_with?(".txt") && File.file?(filename)
                    war = 0
                else
                    puts 'Your file doesn t exist or you made mistake in entered filename. Try again.'
                end
            end

            file = File.open(filename, "rb")
            plaintext = file.read

            case cipher_id
                when '1'
                    @caesar = Caesar.new()
                    content = @caesar.decryption_Caesar(plaintext)
                begin
                    rescue => exception
                end
                else
                    p 'Błąd wyboru'
            end

            filename = "decrypted" + filename
            file = File.open(filename, "a") 
            file.puts content
            w = 0
        else
            puts 'Error, pleas enter your choice again.'
            w = 1
        end
    end
end