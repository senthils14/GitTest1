global class zzzscheduledBatchable implements Schedulable {
   global void execute(SchedulableContext sc) {
      zzzBatchUpdateTesting BatchUp = new zzzBatchUpdateTesting (); 
      database.executebatch(BatchUp);
   }
}