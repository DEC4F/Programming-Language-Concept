#|
Programming Exercise 1 for EECS 345 PLC
Stanley
|#

; 1. insert takes a number and a list of numbers in order and inserts the number in the proper place
(define insert 
  (lambda (x lst)
    (cond 
      ((null? lst) (list x))                           ; base case, reached end of list
      ((<= x (car lst)) (cons x lst))                  ; match case, x less than current head
      (else (cons (car lst) (insert x (cdr lst)) ))))) ; recursive case

; 2. merge takes two lists of numbers that are in order and returns a list that contains the combination of both lists in order. 
(define merge
  (lambda (lst1 lst2)
    (cond
    ((null? lst1) lst2)                                                          ; base case, when lst1 is empty, return lst2
      ((null? lst2) lst1)                                                        ; the other base case
      ((<= (car lst1) (car lst2)) (cons (car lst1) (merge (cdr lst1) lst2)))     ; recursive case, choose head of lst1 if its smaller
      ((>  (car lst1) (car lst2)) (cons (car lst2) (merge lst1 (cdr lst2)))) ))) ; the other recursive case

; 3. removedups takes a list of atoms and removes any atom that is a repeat of the atom that immediately precedes it 
(define removedups
  (lambda (lst)
    (cond 
      ((null? (cdr lst)) lst)                             ; base case, return current list if current list only contains 1 element
      ((eq? (car lst) (cadr lst)) (removedups (cdr lst))) ; recursive case, call removedups on next list if current head = next head
      (else (cons (car lst) (removedups (cdr lst)))) )))  ; recursive case, append head to what's returned by calling removedups on next list

; 4. split h a list of atoms and returns a list that contains two lists of atoms. The first list should contain the 1st, 3rd, 5th, ... atoms, and the second list should contain the 2nd, 4th, 6th, ... atoms. 
(define split
  (lambda (lst)
    (if (or (null? lst) (null? (cdr lst)))                   ; if either current list is null or only contain 1 element
      (list lst '())                                         ; base case, return a list of current list and a null list
      (list (cons (car lst) (car (split (cddr lst))))        ; recursive step, append the head to the head of next next element returned
            (cons (cadr lst) (cadr (split (cddr lst)))) )))) ; recursive case, append the next head to the next head of element returned

; 5. deepcons takes an element and a list, that possibly containst sublists and places the element in the front of the first element, as deep in the sublist as needed
(define deepcons
  (lambda (x lst)
    (cond
      ((null? (car lst)) (cons x (cdr lst)))                      ; edge case, append x to the rest if the head of curr list is null,
      ((pair? (car lst)) (cons (deepcons x (car lst)) (cdr lst))) ; recursive case, append result of deepcons of x and curr head (sublist) with rest
      (else (cons x lst))                                         ; base case, append x to the list
    )
  ))

; 6. numparens takes a list and returns the number of pairs of parentheses 
;TODO not done yet
(define numparens
  (lambda (lst)
    (cond
      ((null? lst) 1) 
      ((pair? (car lst)) 1 + (numparens (car lst)) + (numparens (cdr lst))) 
      (else 0 + (numparens (cdr lst))) ))) 

; base case, list end, return 1 as the pren of the input list
; recursive case, add 1 to the output of curr sublist and the rest
; recursive case, add 0 to the output of the rest 

; 7. dup* takes a list and duplicates all contents, including any sublists 
;TODO not done yet
(define dup* 
  (lambda (lst) 
    (cond 
      ((null? lst) '()) 
      ((pair? car lst) (cons (list (dup* (car lst)) (dup* (car lst)) ) (dup* (cdr lst)))) 
      (else (cons (list (car lst) (car lst)) (dup* (cdr lst)))) )))

; base case, reached the list end
; recursive case, dup the sublist itself and recursive dup its element and append to dup of rest
; recursive case, dup curr head and append to result of the rest

; 8. removedups* takes a list, that can contain sublists, and removes any atom that is the repeat of the atom that immediately precedes it in the same sublist
(define removedups* 
  (lambda (lst) 
    (cond 
    )))

; 9. split* takes a list, that can contain sublists, and returns a list containing two lists. The first list should contain the 1st, 3rd, 5th, ... elements, and the second list should contain the 2nd, 4th, 6th, ... elements. However, if any of these elements are also lists, these elements should be split as well.
(define split* 
  (lambda (lst) 
    (cond 
    )))

; 10. removedups** takes a list, that can contain sublists, and removes any element that, once repeated elements have been removed from it, is the repeat of any element (also once elements have been removed from it) that immediately precedes it in the same sublist
(define removedups**
  (lambda (lst) 
    (cond 
    )))
