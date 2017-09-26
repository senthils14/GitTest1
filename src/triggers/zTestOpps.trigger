trigger zTestOpps on Opportunity (before update) {
    List<task> Tasks = new List<task>();
    List<opportunity> oppLis = Trigger.new;
      for(Opportunity opp:oppLis)
         {
              Task tsk = new Task(whatID = Opp.ID, Ownerid = Opp.OwnerId, Subject='TEST');
              Tasks.add(tsk);
         }
         insert Tasks;
}