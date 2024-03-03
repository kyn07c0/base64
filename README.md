## Description
This is a simple header-only library for encoding and decoding strings or files using the Base64 algorithm.
To start using the library, place the base64.hpp file in your project, adding the following directive:
```c++
#include "base64.hpp"
```

## Prerequisites
C++17 or higher

## Usage
###Encode string to Base64
```c++
#include "base64.hpp"

int main()
{
    std::string str_base64 = base64::encode_str("Text");
}
```

###Decode string from Base64
```c++
#include "base64.hpp"

int main()
{
    std::string str = base64::decode_str("VGV4dA==");
}
```

###Encode file to string Base64
```c++
#include "base64.hpp"

int main()
{
    std::string str_base64 = base64::encode_file("input_file.txt");
}
```

###Decode file from string Base64
```c++
#include "base64.hpp"

int main()
{
    base64::decode_file(str_base64, "output_file.txt");
}
```

## Base64 algorithm
The encoding got its name from the representation of binary data in 64 ASCII characters:
```
A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,
Q,R,S,T,U,V,W,X,Y,Z,a,b,c,d,e,f,
g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,
w,x,y,z,0,1,2,3,4,5,6,7,8,9,+,/
```

### Base64 encoding algorithm
Divide a sequence of bytes into groups of three bytes. There are 3 possible cases:
- the number of bytes is a multiple of 3 (all groups are 3 bytes);
- the number of bytes is not a multiple of 3 (the last group has 2 bytes);
- the number of bytes is not a multiple of 3 (the last group has 1 byte);

Process each group in one of the following ways:

Example of processing a group of 3 bytes (11010011 10110111 00110100)
1) Divide the 24-bit sequence into 4 groups of 6 bits (110100 111011 011100 110100).
2) Get the decimal value of each 6-bit group (52 59 28 52).
3) Map the decimal value to the Base64 character position, preserving their order (07c0).

Example of processing a group of 2 bytes (11010011 10110111)
1) Divide the 16-bit sequence into 2 groups of 6 bits and one group of 4 bits (110100 111011 0111).
2) Pad the last group with two zeros to get a 6-bit group (110100 111011 011100).
3) Get the decimal value of each 6-bit group (52 59 28).
4) Map the decimal value to the Base64 character position, preserving their order (07s).
5) Get a 4-character Base64 string by appending the "=" sign to it (07s=).

Example of processing a group with 1 byte (11010011)
1) Divide the 8-bit sequence into a group of 6 bits and a group of 2 bits (110100 11).
2) Pad the last group with four zeros to get a 6-bit group (110100 110000).
3) Get the decimal value of each 6-bit group (52 48).
4) Map the decimal value to the Base64 character position, preserving their order (0w).
5) Get a 4-character Base64 string by adding two "=" characters to it (0w==).

### Base64 decoding algorithm
Split the Base64 string into groups of 4 characters. There are 3 options for such groups:
- without the "=" sign;
- with one "=" symbol at the end;
- with two "=" characters at the end;

Process each group in one of the following ways:

An example of processing a group without the "=" symbol (AQgh).
1) Get the decimal value of each character from the base64 set (0 16 32 33).
2) Represent decimal position values in 6-bit format (000000 010000 100000 100001).
3) Concatenate binary values into a 24-bit sequence (3 bytes), preserving order (00000001 00001000 00100001).

An example of processing a group with one symbol "=" (AQg=).
1) Get the decimal value of the first three characters from the base64 set (0 16 32).
2) Represent decimal values in 6-bit format (000000 010000 100000).
3) Remove the last two zeros (000000 010000 1000 ~~00~~).
4) Concatenate a 16-bit sequence (2 bytes), keeping the sequence (00000001 00001000).

An example of processing a group with two symbols "=" (AQ==).
1) Get the decimal value of the first two characters from the base64 set (0 16).
2) Represent decimal values in 6-bit format (000000 010000).
3) Remove the last four zeros (000000 01 ~~0000~~).
4) Receive a sequence of 8 bits (1 byte) (00000001).