; expmod calling
(square (expmod base exp m)) ; or
(* (expmod base exp m) (expmod base exp m))

; When expmod use square function, the parameter (expmod base exp m) is evaluated once.
; However, using * instead of square function evaluates both of the two parameters.
; Thus, O(log n) -> O(log 2^n) = O(nlog 2) = O(n)
