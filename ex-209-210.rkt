#lang htdp/bsl+

(require test-engine/racket-tests)

; ==================== Exercise 209 ====================
; ### Data Definitions
; A Word is one of:
; - '()
; - (const 1-String Word)
 
; A List-of-words is one of:
; - '()
; - (Word List-of-words)
 

; ### Functions
; String -> Boolean
; Function for testing purposes
(define (all-words-from-rat? w)
  (and 
    (member? "rat" w) 
    (member? "art" w) 
    (member? "tar" w)
    ))
 

; String -> List-of-strings
; find all words that the letters of some given word spell
; (check-member-of (alternative-words "cat") (list "act" "cat") (list "cat" "act"))
; (check-satisfied (alternative-words "rat") all-words-from-rat?)
(define (alternative-words s)
  (in-dictionary
    (words->strings 
      (arrangements 
        (string->word s)
        ))))


; List-of-strings -> List-of-strings
; Filters out non valid strings, i.e. strings that do not appead in the dict
(define (in-dictionary los)
  '()
  )
 

; Word -> List-of-words
; Find all re-arrangements of word
(define (arrangements word)
  (list word)
  )


; String -> Word
; Turns the string s into a Word
(check-expect (string->word "hola") (list "h" "o" "l" "a"))
(define (string->word s)
  (explode s)
  )


; Word -> String
; Turns the Word w into a String
(check-expect (word->string (list "h" "o" "l" "a")) "hola")
(define (word->string w)
  (implode w)
  )

; =================== End of exercise ==================




; ==================== Exercise 210 ====================
; ### Functions
; List-of-strings -> List-of-words
; Turns Strings into Words
(check-expect 
  (strings->words (list "hey" "yo"))
  (list (list "h" "e" "y") (list "y" "o"))
  )
(define (strings->words los)
  (cond
    [(empty? los) '()]
    [else
      (cons
        (string->word (first los))
        (strings->words (rest los))
        )]))


; List-of-words -> List-of-strings
; Turn all Words in low into Strings 
(check-expect 
  (words->strings (list (list "h" "e" "y") (list "y" "o")))
  (list "hey" "yo")
  )
(define (words->strings low) 
  (cond 
    [(empty? low) '()]
    [else 
      (cons 
        (implode (first low))
        (words->strings (rest low))
        )]))

; =================== End of exercise ==================


(test)
