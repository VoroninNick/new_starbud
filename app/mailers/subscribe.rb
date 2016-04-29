class Subscribe < ApplicationMailer

  def become_a_dealer(data)
    @data = data
    mail( :layout => false, :subject => "#{@data[:name]}, забажав стати диллером ...", :to => 'nazariy.papizh@gmail.com')
  end

  def contact_us(data)
    @data = data
    mail( :layout => false, :subject => "#{@data[:name]}, написав нам ...", :to => 'nazariy.papizh@gmail.com')
  end

end
