class Library

  def initialize
    @books = []
  end

  def list_books
    @books.each do |book|
      print book.title + ' - ' + book.status
      puts ''
    end
  end

  def borrowed_books
    @books.each do |book|
      puts book.title + ' - ' + book.borrower if book.status == "checked_out"
    end
  end

  def available_books
    @books.each do |book|
      puts book.title if book.status == "available"
    end
  end

  def add_book(book)
    @books << book
  end

  def check_out(user, book)
    if book.status == "available"
      if user.checked_out_books.length < 2
        user.checked_out_books << book
        # puts user.checked_out_books
        book.status = "checked_out"
        book.borrower = user.name
        puts book.title + ' - ' + book.status
      else
        puts "Sorry, #{user.name}, you already have two books out. "
      end
    else
      puts "Sorry, #{user.name}, #{book.title} is checked out."
    end
  end

  def check_in(book)
    if book.status == "checked_out"
      book.status = "available"
    end
  end

  def book_review(book)
    puts "Please rate this title, from 0 to 5 stars."
    puts "The current average review is #{book.rating[0]}, which is out of #{book.rating[1]} reviews."
    puts "0 - 5?"
    rate = gets.chomp
    rate = rate.to_i
    #rating = [average rating, total ratings]
    total = (book.rating[0] + rate)
    book.rating[0] = total / (book.rating[1] + 1)
    book.rating[1] += 1
    puts "Thanks! The average review is now #{book.rating[0]}, which is out of #{book.rating[1]} reviews."
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
