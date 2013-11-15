require_relative "library.rb"

puts "create our library"
library = Library.new
puts "-------------------------"

puts "create our borrowers"
mike = Borrower.new("Mike")
ricardo = Borrower.new("Ricardo")
gilbert = Borrower.new("Gilbert")
puts "-------------------------"

puts "create our books"
stranger = Book.new("The Stranger", "Albert Camus")
nausea = Book.new("Nausea", "Jean-Paul Sartre")
karamazov = Book.new("The Brothers Karamazov", "Fyodor Dostoesvky")
feynman = Book.new("Surely You're Joking Mr. Feynman", "Richard Feynman")
finnegan = Book.new("Finnegans Wake", "James Joyce")
k_and_r = Book.new("The C Programming Language", "Kernighan and Ritchie")
puts "-------------------------"

puts "add our books to the library"
library.add_book(stranger)
library.add_book(nausea)
library.add_book(karamazov)
library.add_book(feynman)
library.add_book(finnegan)
library.add_book(k_and_r)
puts "-------------------------"

puts "list all six books in the library's catalog with their status:"
library.list_books
puts "-------------------------"

puts "check out two books for mike"
library.check_out(mike, stranger)
library.check_out(mike, nausea)
puts "-------------------------"

puts "check out two books for gilbert"
library.check_out(gilbert, karamazov)
library.check_out(gilbert, feynman)
puts "-------------------------"

puts "list all six books in the library's catalog with their statuses:"
library.list_books
puts "-------------------------"

puts "try to check out another book for Mike, this should fail since he already
  has two out"
library.check_out(mike, finnegan)
puts "-------------------------"

puts "this book should still be available since it failed before"
library.check_out(ricardo, finnegan)
puts "-------------------------"

puts "but this book should fail since it is already checked out"
library.check_out(ricardo, stranger)
puts "-------------------------"

puts "these should return the books each user checked out"
puts ''
puts "mike:"
mike.borrowed_books_list
puts ''
puts "gilbert:"
gilbert.borrowed_books_list
puts ''
puts "ricardo:"
ricardo.borrowed_books_list
puts "-------------------------"

puts "this should only show the borrowed books with their borrowers"
library.borrowed_books
puts "-------------------------"

puts "this should only show the available books"
library.available_books
puts "-------------------------"

puts "Please rate The Stranger."
library.book_review(stranger)

