class Url < ApplicationRecord
        
    
    def convert_base85_to_new_url

        base85_num = convert_id_to_base85
        
        #array of permissable url characters(total = 85 characters, hence base 85)
        url_characters = [
            "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p","q",
            "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H",
            "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y",
            "Z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "-", "_", ".", "~", "!", "*",
            "'", "(", ")", ";", ":", "@", "&", "=", "+", "$", ",", "/", "?", "%", "#", "[", "]" ]
            
            base_url = "sho.rt/"
            str = ""
            
            #splits the series of base 85 numbers into individual numbers
            #each base 85 number in the array will reperesent the index of 
            #the character that will used to create str
            base85_num.split(" ").each do |n|
                str += url_characters[n.to_i].to_s
            end
            
            return base_url + str
        end
        
        private
        
        def convert_id_to_base85
            url_id = id
            str = ""
            
            #convert the id from base 10 to base 85 using the division and modulus method
            #placing space between each base 85 number for separation and clarity purposes
            while (url_id > 0)
                str += (url_id % 85).to_s
                str += " "
                url_id /= 85
            end
            
            #string needs to be reverse after using division and modulus conversion method
            #.strip is used to remove the leading whitespace after the string is reversed
            return str.reverse.strip
        end
    end
    