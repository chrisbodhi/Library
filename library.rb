class Library

  def initialize
    @books = []
  end
  
  # Public: Prints the title and status of all books in the library then moves 
  # to a new line using puts ''.
  #
  # Examples
  #
  #   list_books
  #   # => The Stranger - available
  #   # => Nausea - available
  #
  # Returns nil.
  def list_books
    @books.each do |book|
      print book.title + ' - ' + book.status
      puts ''
    end
  end

  # Public: Puts the title and borrower of books checked out of the library.
  #
  # Examples
  #
  #   borrowed_books
  #   # => The Stranger - Mike
  #   # => Nausea - Mike
  #
  # Returns nil.
  def borrowed_books
    @books.each do |book|
      puts book.title + ' - ' + book.borrower if book.status == "checked_out"
    end
  end

  # Public: Puts the title of all available books in the library.
  #
  # Examples
  #
  #   available_books
  #   # => The Stranger
  #   # => Nausea
  #
  # Returns nil.
  def available_books
    @books.each do |book|
      puts book.title if book.status == "available"
    end
  end

  # Public: Adds a book object to the library.
  #
  # book - initialized Object from the Book Class
  #
  # Examples
  #
  #   add_book(stranger)
  #
  # Returns nil.
  def add_book(book)
    @books << book
  end

  # Public: Checks a book out to a user if the book is available and if the user has fewer than two books checked out. The book status is changed, the book is added to the user's list of checked out books, and the book's borrower attribute is changed to the user's name. 
  #
  # user - initialized Object from the Borrower Class
  # book - initialized Object from the Book Class
  #
  # Examples
  #
  #   check_out(mike, stranger)
  #
  #   check_out(gilbert, stranger)
  #   # => Sorry Gilbert, The Stranger is checked out.
  #   
  #   check_out(mike, feynman)
  #   # => Sorry, Mike, you already have two books out.
  #
  # Returns nil.
  def check_out(user, book)
    if book.status == "available"
      if user.checked_out_books.length < 2
        user.checked_out_books << book
        book.status = "checked_out"
        book.borrower = user.name
      else
        puts "Sorry, #{user.name}, you already have two books out. "
      end
    else
      puts "Sorry, #{user.name}, #{book.title} is checked out."
    end
  end

  # Public: If a book has been checked out, the status is changed to available.
  #
  # book - initialized Object from the Book Class
  #
  # Examples
  #
  #   check_in(stranger)
  #
  # Returns nil.
  def check_in(book)
    if book.status == "checked_out"
      book.status = "available"
    end
  end

  # Public: Prompts the user to submit a rating (from 0 to 5) for the book.
  #
  # book - initialized Object from the Book Class
  #
  # book.rating is an array of [average rating, total ratings]
  #
  # Examples
  #
  #   check_in(stranger)
  #
  # Returns the rating in the form of an Array of two numbers.
  def book_review(book)
    puts "Please rate this title, from 1 to 5 stars."
    puts "The current average review is #{book.rating[0]}, which is out of #{book.rating[1]} reviews."
    puts "1 - 5?"

    rate = gets.chomp

    rate = rate.to_i

    if rate.between?(1,5)
      total = (book.rating[0] + rate)
      book.rating[0] = total / (book.rating[1] + 1)
      book.rating[1] += 1
      puts "Thanks! The average review is now #{book.rating[0]}, which is out of #{book.rating[1]} reviews."
    else
      puts "That's no good. Try again."
      book_review(book)
    end

    book.rating
  end

end

class Borrower

  attr_reader :name
  attr_accessor :checked_out_books

  def initialize(name)
    @name = name
    @checked_out_books = []
  end

  def borrowed_books
    @checked_out_books.each do |book|
      puts book.title
    end
  end

  def borrowed_books_list
    @checked_out_books.each do |book|
      puts book.title
    end
  end

end

class Book

  attr_reader :title, :author
  attr_accessor :status, :borrower, :rating

  def initialize(title, author)
    @title = title
    @author = author
    @status = "available"
    @borrower = nil
    @rating = [0, 0] #[average rating, total ratings]
    @year_published = nil
    @edition = nil
  end

end
