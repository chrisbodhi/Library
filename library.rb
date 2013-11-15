class Library

  def initialize
    @books = []
  end

  def books
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
        user.checked_out_books.each { |book| puts book.title + ' - ' + book.status }
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

  def borrowed_books_count
    @checked_out_books.length
  end

  def borrowed_books_list
    @checked_out_books.each do |book|
      puts book.title
    end
  end

end

class Book
  attr_reader :title, :author
  attr_accessor :status, :borrower

  def initialize(title, author)
    @title = title
    @author = author
    @status = "available"
    @borrower = nil
  end

end
