 
  # quest num [1]

  module Generic 
  
  def current_date
  return (Time.now.strftime("%Y-%m-%d")).to_s

  end
  
  end
  class Document

  attr_accessor :author , :title , :content

  # quest num [6]
  include Generic

  def initialize(attributes = {})
    @author = attributes[:author]
    @title = attributes[:title]
    @content = attributes[:content]
  end
  
  # quests num [2] && [3]
  def +(d)

  if d.class.to_s == String.to_s
  return Document.new(author:"",title:"",content: self.content + d)
  else
  return Document.new(author:"",title:"",content: self.content + d.content)
  end

  end

  # quest num [4]
  def words
  sc = self.content  
  return (sc.split(' ')).to_a.inspect
  end

  # quest num [5]
  def each_word
  yield((self.content.split(' ')).to_a)
  end
  
  # quest num [6]
  def title_with_date
  return self.title + " " + current_date
  end
 
  # quest num [7]
  def replace_word(old,new)
  a = (self.content.split(' ')).to_a
  i = a.index(old)
  a[i] = new;
  self.content = a.join(' ')
  end

  # quest num [8]
  def method_missing(name,*args)
  arr = ((name.to_s).split('_')).to_a
   old = arr[1]
   new = args[0]

  a = (self.content.split(' ')).to_a
  i = a.index(old)
  a[i] = new;
  self.content = a.join(' ')

  end

  end



  a = Document.new(author:"Bassam",title:"Relativity",content:"This is the content of the book ")
  b = Document.new(author:"Jasmine",title:"The last meeting",content:"This is the content of the book")
  
  # Results 

  # Results of quest num [2] 
  c = a+b
  puts c.content
  
  # Results of quest num [3]
  d = a + "abcdefghijklmnopqrstuvwxyz"
  puts d.content

  # Results of quest num [4]
  puts a.words

  # Results of quest num [5]
  a.each_word do |word|
  puts word
  end
  
  # Results of quest num [6]
  puts a.title_with_date
  
  # Results of quest num [7]
  puts "This is the initial content: " + a.content
  puts "This is the modified contnet :" + a.replace_word("book","magazine")

  # Results of quest num [8]
  a.content = "This is the content of the book" # here just to get back the initial content of the document
  puts a.replace_book('pen')
  
  # we may also replace any word with another word just like 'content' with 'body'
  puts a.replace_content('body')


