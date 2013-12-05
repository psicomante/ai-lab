
;   Labirinth Graphics Representation
;   - - - - - - - -
;   |W|W|W|W|W|G|W|W|W|W|W|W|W|G|W|W| 10
;    - - - - - - - - - - - - - - - -
;   |W| | | |W| | |W| | | | |W| | |W| 9
;    - - - - - - - - - - - - - - - -
;   |W| | | |W| | |W| | | | |W| | |W| 8
;    - - - - - - - - - - - - - - - -
;   |W| | | |W| | |W|W|W| | |W|W| |W| 7
;    - - - - - - - - - - - - - - - -
;   |W| | | |W| | | | |W| | |W| | |G| 6
;    - - - - - - - - - - - - - - - -
;   |W| | | |W| | |W| |W| |W|W| |W|W| 5
;    - - - - - - - - - - - - - - - -
;   |W| |W| | | | |W| | | | |W| | |W| 4
;    - - - - - - - - - - - - - - - -
;   |W| |W| | |W|W|W|W| |W|W|W|W| |W  3
;    - - - - - - - - - - - - - - - -
;   |W| | |W|W| | |W| | |W| |W| | |W  2
;    - - - - - - - - - - - - - - - -
;   |W| | | | | | |W| | | | | | |W|W| 1
;    - - - - - - - - - - - - - - - -
;   |W|W|W|W|G|W|W|W|W|W|W|W|G|W|W|W| 0
;    - - - - - - - - - - - - - - - -
;    0 1 2 3 4 5 6 7 8 9 101112131415

; map domain
(deffacts domain
  (cell (pos-r 0) (pos-c 0) (contains wall))
  (cell (pos-r 0) (pos-c 1) (contains wall))
  (cell (pos-r 0) (pos-c 2) (contains wall))
  (cell (pos-r 0) (pos-c 3) (contains wall))
  (cell (pos-r 0) (pos-c 4) (contains gate))
  (cell (pos-r 0) (pos-c 5) (contains wall))
  (cell (pos-r 0) (pos-c 6) (contains wall))
  (cell (pos-r 0) (pos-c 7) (contains wall))
  (cell (pos-r 0) (pos-c 8) (contains wall))
  (cell (pos-r 0) (pos-c 9) (contains wall))
  (cell (pos-r 0) (pos-c 10) (contains wall))
  (cell (pos-r 0) (pos-c 11) (contains wall))
  (cell (pos-r 0) (pos-c 12) (contains gate))
  (cell (pos-r 0) (pos-c 13) (contains wall))
  (cell (pos-r 0) (pos-c 14) (contains wall))
  (cell (pos-r 0) (pos-c 15) (contains wall))
  (cell (pos-r 1) (pos-c 0) (contains wall))
  (cell (pos-r 1) (pos-c 1) (contains empty))
  (cell (pos-r 1) (pos-c 2) (contains empty))
  (cell (pos-r 1) (pos-c 3) (contains empty))
  (cell (pos-r 1) (pos-c 4) (contains empty))
  (cell (pos-r 1) (pos-c 5) (contains empty))
  (cell (pos-r 1) (pos-c 6) (contains wall))
  (cell (pos-r 1) (pos-c 7) (contains empty))
  (cell (pos-r 1) (pos-c 8) (contains empty))
  (cell (pos-r 1) (pos-c 9) (contains empty))
  (cell (pos-r 1) (pos-c 10) (contains empty))
  (cell (pos-r 1) (pos-c 11) (contains empty))
  (cell (pos-r 1) (pos-c 12) (contains empty))
  (cell (pos-r 1) (pos-c 13) (contains empty))
  (cell (pos-r 1) (pos-c 14) (contains wall))
  (cell (pos-r 1) (pos-c 15) (contains wall))
  (cell (pos-r 2) (pos-c 0) (contains wall))
  (cell (pos-r 2) (pos-c 1) (contains empty))
  (cell (pos-r 2) (pos-c 2) (contains empty))
  (cell (pos-r 2) (pos-c 3) (contains wall))
  (cell (pos-r 2) (pos-c 4) (contains wall))
  (cell (pos-r 2) (pos-c 5) (contains empty))
  (cell (pos-r 2) (pos-c 6) (contains empty))
  (cell (pos-r 2) (pos-c 7) (contains wall))
  (cell (pos-r 2) (pos-c 8) (contains empty))
  (cell (pos-r 2) (pos-c 9) (contains empty))
  (cell (pos-r 2) (pos-c 10) (contains wall))
  (cell (pos-r 2) (pos-c 11) (contains empty))
  (cell (pos-r 2) (pos-c 12) (contains wall))
  (cell (pos-r 2) (pos-c 13) (contains empty))
  (cell (pos-r 2) (pos-c 14) (contains empty))
  (cell (pos-r 2) (pos-c 15) (contains wall))
  (cell (pos-r 3) (pos-c 0) (contains wall))
  (cell (pos-r 3) (pos-c 1) (contains empty))
  (cell (pos-r 3) (pos-c 2) (contains wall))
  (cell (pos-r 3) (pos-c 3) (contains empty))
  (cell (pos-r 3) (pos-c 4) (contains empty))
  (cell (pos-r 3) (pos-c 5) (contains wall))
  (cell (pos-r 3) (pos-c 6) (contains wall))
  (cell (pos-r 3) (pos-c 7) (contains wall))
  (cell (pos-r 3) (pos-c 8) (contains wall))
  (cell (pos-r 3) (pos-c 9) (contains empty))
  (cell (pos-r 3) (pos-c 10) (contains wall))
  (cell (pos-r 3) (pos-c 11) (contains empty))
  (cell (pos-r 3) (pos-c 12) (contains wall))
  (cell (pos-r 3) (pos-c 13) (contains wall))
  (cell (pos-r 3) (pos-c 14) (contains empty))
  (cell (pos-r 3) (pos-c 15) (contains wall))
  (cell (pos-r 4) (pos-c 0) (contains wall))
  (cell (pos-r 4) (pos-c 1) (contains empty))
  (cell (pos-r 4) (pos-c 2) (contains wall))
  (cell (pos-r 4) (pos-c 3) (contains empty))
  (cell (pos-r 4) (pos-c 4) (contains empty))
  (cell (pos-r 4) (pos-c 5) (contains empty))
  (cell (pos-r 4) (pos-c 6) (contains empty))
  (cell (pos-r 4) (pos-c 7) (contains wall))
  (cell (pos-r 4) (pos-c 8) (contains  empty))
  (cell (pos-r 4) (pos-c 9) (contains  empty))
  (cell (pos-r 4) (pos-c 10) (contains wall))
  (cell (pos-r 4) (pos-c 11) (contains  empty))
  (cell (pos-r 4) (pos-c 12) (contains wall))
  (cell (pos-r 4) (pos-c 13) (contains  empty))
  (cell (pos-r 4) (pos-c 14) (contains  empty))
  (cell (pos-r 4) (pos-c 15) (contains wall))
  (cell (pos-r 5) (pos-c 0) (contains wall))
  (cell (pos-r 5) (pos-c 1) (contains empty))
  (cell (pos-r 5) (pos-c 2) (contains empty))
  (cell (pos-r 5) (pos-c 3) (contains empty))
  (cell (pos-r 5) (pos-c 4) (contains wall))
  (cell (pos-r 5) (pos-c 5) (contains empty))
  (cell (pos-r 5) (pos-c 6) (contains empty))
  (cell (pos-r 5) (pos-c 7) (contains wall))
  (cell (pos-r 5) (pos-c 8) (contains  empty))
  (cell (pos-r 5) (pos-c 9) (contains wall))
  (cell (pos-r 5) (pos-c 10) (contains wall))
  (cell (pos-r 5) (pos-c 11) (contains wall))
  (cell (pos-r 5) (pos-c 12) (contains wall))
  (cell (pos-r 5) (pos-c 13) (contains  empty))
  (cell (pos-r 5) (pos-c 14) (contains wall))
  (cell (pos-r 5) (pos-c 15) (contains wall))
  (cell (pos-r 6) (pos-c 0) (contains wall))
  (cell (pos-r 6) (pos-c 1) (contains empty))
  (cell (pos-r 6) (pos-c 2) (contains empty))
  (cell (pos-r 6) (pos-c 3) (contains empty))
  (cell (pos-r 6) (pos-c 4) (contains wall))
  (cell (pos-r 6) (pos-c 5) (contains empty))
  (cell (pos-r 6) (pos-c 6) (contains empty))
  (cell (pos-r 6) (pos-c 7) (contains  empty))
  (cell (pos-r 6) (pos-c 8) (contains  empty))
  (cell (pos-r 6) (pos-c 9) (contains wall))
  (cell (pos-r 6) (pos-c 10) (contains  empty))
  (cell (pos-r 6) (pos-c 11) (contains  empty))
  (cell (pos-r 6) (pos-c 12) (contains wall))
  (cell (pos-r 6) (pos-c 13) (contains  empty))
  (cell (pos-r 6) (pos-c 14) (contains  empty))
  (cell (pos-r 6) (pos-c 15) (contains gate))
  (cell (pos-r 7) (pos-c 0) (contains wall))
  (cell (pos-r 7) (pos-c 1) (contains empty))
  (cell (pos-r 7) (pos-c 2) (contains empty))
  (cell (pos-r 7) (pos-c 3) (contains empty))
  (cell (pos-r 7) (pos-c 4) (contains wall))
  (cell (pos-r 7) (pos-c 5) (contains empty))
  (cell (pos-r 7) (pos-c 6) (contains empty))
  (cell (pos-r 7) (pos-c 7) (contains wall))
  (cell (pos-r 7) (pos-c 8) (contains wall))
  (cell (pos-r 7) (pos-c 9) (contains wall))
  (cell (pos-r 7) (pos-c 10) (contains  empty))
  (cell (pos-r 7) (pos-c 11) (contains  empty))
  (cell (pos-r 7) (pos-c 12) (contains wall))
  (cell (pos-r 7) (pos-c 13) (contains wall))
  (cell (pos-r 7) (pos-c 14) (contains  empty))
  (cell (pos-r 7) (pos-c 15) (contains wall))
  (cell (pos-r 8) (pos-c 0) (contains wall))
  (cell (pos-r 8) (pos-c 1) (contains empty))
  (cell (pos-r 8) (pos-c 2) (contains empty))
  (cell (pos-r 8) (pos-c 3) (contains empty))
  (cell (pos-r 8) (pos-c 4) (contains wall))
  (cell (pos-r 8) (pos-c 5) (contains empty))
  (cell (pos-r 8) (pos-c 6) (contains empty))
  (cell (pos-r 8) (pos-c 7) (contains wall))
  (cell (pos-r 8) (pos-c 8) (contains  empty))
  (cell (pos-r 8) (pos-c 9) (contains  empty))
  (cell (pos-r 8) (pos-c 10) (contains  empty))
  (cell (pos-r 8) (pos-c 11) (contains  empty))
  (cell (pos-r 8) (pos-c 12) (contains wall))
  (cell (pos-r 8) (pos-c 13) (contains  empty))
  (cell (pos-r 8) (pos-c 14) (contains  empty))
  (cell (pos-r 8) (pos-c 15) (contains wall))
  (cell (pos-r 9) (pos-c 0) (contains wall))
  (cell (pos-r 9) (pos-c 1) (contains empty))
  (cell (pos-r 9) (pos-c 2) (contains empty))
  (cell (pos-r 9) (pos-c 3) (contains empty))
  (cell (pos-r 9) (pos-c 4) (contains wall))
  (cell (pos-r 9) (pos-c 5) (contains empty))
  (cell (pos-r 9) (pos-c 6) (contains empty))
  (cell (pos-r 9) (pos-c 7) (contains wall))
  (cell (pos-r 9) (pos-c 8) (contains  empty))
  (cell (pos-r 9) (pos-c 9) (contains  empty))
  (cell (pos-r 9) (pos-c 10) (contains  empty))
  (cell (pos-r 9) (pos-c 11) (contains  empty))
  (cell (pos-r 9) (pos-c 12) (contains wall))
  (cell (pos-r 9) (pos-c 13) (contains  empty))
  (cell (pos-r 9) (pos-c 14) (contains  empty))
  (cell (pos-r 9) (pos-c 15) (contains wall))
  (cell (pos-r 10) (pos-c 0) (contains wall))
  (cell (pos-r 10) (pos-c 1) (contains wall))
  (cell (pos-r 10) (pos-c 2) (contains wall))
  (cell (pos-r 10) (pos-c 3) (contains wall))
  (cell (pos-r 10) (pos-c 4) (contains wall))
  (cell (pos-r 10) (pos-c 5) (contains gate))
  (cell (pos-r 10) (pos-c 6) (contains wall))
  (cell (pos-r 10) (pos-c 7) (contains wall))
  (cell (pos-r 10) (pos-c 8) (contains wall))
  (cell (pos-r 10) (pos-c 9) (contains wall))
  (cell (pos-r 10) (pos-c 10) (contains wall))
  (cell (pos-r 10) (pos-c 11) (contains wall))
  (cell (pos-r 10) (pos-c 12) (contains wall))
  (cell (pos-r 10) (pos-c 13) (contains gate))
  (cell (pos-r 10) (pos-c 14) (contains wall))
  (cell (pos-r 10) (pos-c 15) (contains wall))
)
