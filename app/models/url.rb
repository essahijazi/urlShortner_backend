class Url < ApplicationRecord
    
    def convert_id_to_base85(url_id)
        url_id = url_id.to_i
        str = ""
        
        while (url_id > 0)
            str += (url_id % 85).to_s
            str += " "
            url_id /= 85
        end
        
        return str.reverse.strip
    end

    def convert_base85_to_new_url(base85_num)

        url_characters = [
                "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p","q",
                "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H",
                "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y",
                "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "-", "_", ".", "~", "!", "*",
                "'", "(", ")", ";", ":", "@", "&", "=", "+", "$", ",", "/", "?", "%", "#", "[", "]" ]

        base_url = "sho.rt/"
        str = ""

        base85_array = base85_num.split(" ")
        puts base85_array[0];
        
        base85_num.split(" ").each do |n|
            str += url_characters[n.to_i].to_s
        end

        return base_url + str
    end
end
