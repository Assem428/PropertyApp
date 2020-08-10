public class ScheduleGenerateInvoice implements Schedulable  {
    public void execute (SchedulableContext context){
            Database.executeBatch(new GenerateInvoiceBatchJob());
        }
    }