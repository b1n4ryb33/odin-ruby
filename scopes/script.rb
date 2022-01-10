class Computer

   @@users = {}

  def initialize(username, password)
    @username = username
    @password = password

    @@users[username] = password
  end

  protected
  def username 
    @username
  end 


end

class Mac < Computer

  def username
    super()
  end


end



# Runtime
# first = Computer.new("Hendrik", "istderbeste")
second = Mac.new("Theresa", "istnochvielbesser")


# puts first.username
puts second.username



# @@ klassenvariabel
# @ klasseninstanzvariabel