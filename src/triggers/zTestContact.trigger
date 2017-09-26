trigger zTestContact on Contact  (before insert, before update) {
    for(contact myCont : trigger.new){
      MyCOnt.Email = 'test@gmail123.com';
              
    }
}