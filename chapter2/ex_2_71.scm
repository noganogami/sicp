; the most frequent symbol require 1 bit to encode, while the least frequent
; symbol require n-1 bits.

; n = 5
;
;    31
;   /  \
; 16    15
;      /  \
;     8    7
;         / \
;        4   3
;           / \
;          2   1

; n = 10
;
;    1023
;   /    \
; 512    511
;       /   \
;     256   255
;          /   \
;        128   127
;             /   \
;           64     63
;                 /  \
;               32    31
;                    /  \
;                  16    15
;                       /  \
;                      8    7
;                          / \
;                         4   3
;                            / \
;                           2   1
