class Program
    require_relative 'Caesar'
    require_relative 'AffineCipher'
    require_relative 'PBCipher'

    puts 'Wybierz algorytm szyfrujący.'
    puts '1-Szyfr Cezara'
    puts '2-Szyfr afiniczny'
    puts '3-Blokowy szyfr permutacyjny'

    @cipher_id = gets.chomp

    puts 'Podaj tekst do zaszyfrowania.'

    @plaintext = gets.chomp

    case @cipher_id
        when '1'
            @caesar = Caesar.new()
            @caesar.encrypt_by_Caesar(@plaintext)
        when '2'
            @ac = AffineCipher.new()
            @ac.affine_cipher(@plaintext)
        when '3'
            @pbc = PBCipher.new()
            @pbc.permutational_block_cipher(@plaintext)
        begin
            rescue => exception
        end
        else
            p 'Błąd wyboru'
    end
end