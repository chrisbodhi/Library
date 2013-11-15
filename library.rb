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
      puts book.title + ' ' + book.borrower if book.status == "checked_out"
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
    # @user = user
    # @book = book
    #allow if status == available
  end

  def check_in(book)
  end
end

class Borrower
  def initialize(name)
    @name = name
  end

  def borrowed_books
    # borrowed = []

    # return borrowed
  end

  def name
  end

  def borrowed_books_count
    # max checked out is 2
    # puts borrowed_books.length
  end

  def borrowed_books_list
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
