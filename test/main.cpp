#include "test_runner.hpp"
#include "src/base64_tests.hpp"

int main()
{
    TestRunner tr;
    RUN_TEST(tr, TestInvalidStringBase64);
    RUN_TEST(tr, TestEncodeBytesMultipliesOfThree);
    RUN_TEST(tr, TestEncodeRemainderOneByte);
    RUN_TEST(tr, TestEncodeRemainderTwoBytes);
    RUN_TEST(tr, TestStringEncode);
    RUN_TEST(tr, TestStringDecode);
    RUN_TEST(tr, TestEncodeAndDecodeFile);
    
    return 0;
}