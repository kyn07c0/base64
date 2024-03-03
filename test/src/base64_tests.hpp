#pragma once

#include <base64/base64.hpp>
#include "test_runner.hpp"

void TestInvalidStringBase64()
{
    try {
        base64::decode("");
    }
    catch (const std::invalid_argument&) {
    }
    
    try {
        base64::decode("2");
    }
    catch (const std::invalid_argument&) {
    }
}

void TestEncodeBytesMultipliesOfThree()
{
    const std::vector<uint8_t> data{85, 85, 85};
    ASSERT_EQUAL(base64::encode(data), "VVVV")
}

void TestEncodeRemainderOneByte()
{
    const std::vector<uint8_t> data{23, 55};
    std::string res = base64::encode(data);
    ASSERT(res.back() == '=')
    ASSERT(res.substr(res.length()-2) != "==")
}

void TestEncodeRemainderTwoBytes()
{
    const std::vector<uint8_t> data{23};
    std::string res = base64::encode(data);
    ASSERT(res.substr(res.length()-2) == "==")
}

void TestStringEncode()
{
    ASSERT_EQUAL(base64::encode_str("Result string Base64 without symbols =."),
                 "UmVzdWx0IHN0cmluZyBCYXNlNjQgd2l0aG91dCBzeW1ib2xzID0u")
    
    ASSERT_EQUAL(base64::encode_str("Result string Base64 with symbol =."),
                 "UmVzdWx0IHN0cmluZyBCYXNlNjQgd2l0aCBzeW1ib2wgPS4=")
    
    ASSERT_EQUAL(base64::encode_str("Result string Base64 with symbols ==."),
                 "UmVzdWx0IHN0cmluZyBCYXNlNjQgd2l0aCBzeW1ib2xzID09Lg==")
}

void TestStringDecode()
{
    ASSERT_EQUAL(base64::decode_str("UmVzdWx0IHN0cmluZyBCYXNlNjQgd2l0aG91dCBzeW1ib2xzID0u"),
                 "Result string Base64 without symbols =.")
    
    ASSERT_EQUAL(base64::decode_str("UmVzdWx0IHN0cmluZyBCYXNlNjQgd2l0aCBzeW1ib2wgPS4="),
                 "Result string Base64 with symbol =.")
    
    ASSERT_EQUAL(base64::decode_str("UmVzdWx0IHN0cmluZyBCYXNlNjQgd2l0aCBzeW1ib2xzID09Lg=="),
                 "Result string Base64 with symbols ==.")
}

void TestEncodeAndDecodeFile()
{
    std::ofstream file("test.txt");
    file << "Test text!";
    file.close();
    
    std::string str_base64 = base64::encode_file("test.txt");
    base64::decode_file(str_base64, "test2.txt");
    
    std::ifstream file2("test2.txt");
    std::string text;
    std::getline(file2, text);
    
    ASSERT_EQUAL("Test text!", text)
    
    std::remove("test.txt");
    std::remove("test2.txt");
}