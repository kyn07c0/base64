#pragma once

#include <vector>
#include <fstream>
#include <bitset>
#include <algorithm>
#include <iostream>

namespace base64 {
    
    const std::string symbols_base64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                       "abcdefghijklmnopqrstuvwxyz"
                                       "0123456789+/";

    std::vector<char> encode_group(std::uint8_t a, std::uint8_t b, std::uint8_t c)
    {
        const std::uint32_t combined_bits = (a << 16) | (b << 8) | c;
    
        const char char1 = symbols_base64[(combined_bits >> 18) & 0x3F];
        const char char2 = symbols_base64[(combined_bits >> 12) & 0x3F];
        const char char3 = symbols_base64[(combined_bits >> 6) & 0x3F];
        const char char4 = symbols_base64[combined_bits & 0x3F];

        return {char1, char2, char3, char4};
    }
    
    std::string encode(const std::vector<std::uint8_t>& buffer)
    {
        const size_t size = buffer.size();
        const unsigned long num_groups = size / 3;
        const size_t size_groups = num_groups * 3;

        std::string str_base64;
        str_base64.reserve((num_groups + 2) * 4);

        for(std::size_t i = 0; i < size_groups; i += 3)
        {
            const std::vector<char> base64_symbols = encode_group(buffer[i], buffer[i+1], buffer[i+2]);
            std::copy(base64_symbols.begin(), base64_symbols.end(), back_inserter(str_base64));
        }

        const unsigned long remaining_chars = size - size_groups;
        if(remaining_chars == 2)
        {
            const std::vector<char> base64_symbols = encode_group(buffer[size-1], buffer[size], 0x00);
    
            str_base64.push_back(base64_symbols[0]);
            str_base64.push_back(base64_symbols[1]);
            str_base64.push_back(base64_symbols[2]);
            str_base64.push_back('=');
        }
        else if(remaining_chars == 1)
        {
            const std::vector<char> base64_chars = encode_group(buffer.back(), 0x00, 0x00);
    
            str_base64.push_back(base64_chars[0]);
            str_base64.push_back(base64_chars[1]);
            str_base64.push_back('=');
            str_base64.push_back('=');
        }

        return str_base64;
    }

    std::string encode_file(const std::string& filename)
    {
        std::ifstream file;
        file.exceptions ( std::ifstream::failbit | std::ifstream::badbit );
        std::vector<uint8_t> buffer = {};
        
        try
        {
            file.open(filename, std::ios::binary);
            buffer.insert(buffer.begin(), std::istreambuf_iterator<char>(file), std::istreambuf_iterator<char>());
        }
        catch(const std::ios_base::failure& e)
        {
            std::cerr << "File opening error." << std::endl;
            std::exit(1);
        }
    
        return encode(buffer);
    }
    
    std::vector<uint8_t> decode_group(char a, char b, char c, char d)
    {
        const uint8_t a_1 = symbols_base64.find(a);
        const uint8_t a_2 = symbols_base64.find(b);
        const uint8_t a_3 = symbols_base64.find(c);
        const uint8_t a_4 = symbols_base64.find(d);
    
        const uint8_t b1 = ((a_1 & 0x3f) << 2) | ((a_2 & 0x30) >> 4);
        const uint8_t b2 = ((a_2 & 0x0f) << 4) | ((a_3 & 0x3c) >> 2);
        const uint8_t b3 = ((a_3 & 0x03) << 6) | ((a_4 & 0x3f) >> 0);
        
        return {b1, b2, b3};
    }
    
    std::vector<uint8_t> decode(const std::string& str_base64)
    {
        if(str_base64.empty())
            throw std::invalid_argument("String base64 is empty");
    
        if((str_base64.size() % 4) == 1)
            throw std::invalid_argument("Invalid length string base64");
    
        std::vector<uint8_t> result = {};
    
        size_t n = str_base64.size() - 4;
        size_t i = 0;
        for(; i < n; i += 4)
        {
            std::vector<uint8_t> d = decode_group(str_base64[i], str_base64[i+1], str_base64[i+2], str_base64[i+3]);
            std::copy(d.begin(), d.end(), back_inserter(result));
        }
    
        if(str_base64.back() == '=')
        {
            if(str_base64.substr(str_base64.length()-2) == "==")
            {
                std::vector<uint8_t> d = decode_group(str_base64[i], str_base64[i+1], 'A', 'A');
                result.push_back(d[0]);
            }
            else
            {
                std::vector<uint8_t> d = decode_group(str_base64[i], str_base64[i+1], str_base64[i+2], 'A');
                std::copy(d.begin(), d.end()-1, back_inserter(result));
            }
        }
        else
        {
            std::vector<uint8_t> d = decode_group(str_base64[i], str_base64[i+1], str_base64[i+2], str_base64[i+3]);
            std::copy(d.begin(), d.end(), back_inserter(result));
        }
        
        return result;
    }
    
    void decode_file(const std::string& str_base64, const std::string& filename)
    {
        try
        {
            const std::vector<uint8_t> buffer = decode(str_base64);
            std::ofstream file(filename, std::ios::binary);
            file.write(reinterpret_cast<const char*>(buffer.data()), static_cast<long>(buffer.size()));
            file.close();
        }
        catch(const std::ofstream::failure& e)
        {
            std::cerr << "Exception writing file" << std::endl;
        }
        catch(const std::invalid_argument& e)
        {
            std::cerr << e.what() << std::endl;
        }
    }

} // namespace base64