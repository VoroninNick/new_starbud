class Subscribe < ApplicationMailer

  def become_a_dealer(data)
    @data = data
    mail( :layout => false, :subject => "#{@data[:name]}, залишив повідомлення ...", :to => 'nazariy.papizh@gmail.com')
  end
end
