 



  def oreder_grades(*attributes)

   hash = Hash.new(0)
   (0..attributes.length - 1).each do |i|
   attributes[i].each {|key| hash[key] += 1}
   end
  hash
 
  end


  ahmed= [80,40,50]
  mohamed=[40,80,90]
  yasmine=[60,90,95]

  puts oreder_grades(ahmed,mohamed,yasmine)
  puts oreder_grades(ahmed,mohamed)


