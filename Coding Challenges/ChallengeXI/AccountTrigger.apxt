trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    Switch on Trigger.OperationType{
        When BEFORE_INSERT{
            AccountTriggerHelper.NoCali(Trigger.new);
        }when BEFORE_UPDATE{
            
        }
        When BEFORE_DELETE{
            //AccountTriggerHelper.PreventDeletion(Trigger.new);
        }when AFTER_INSERT{
            
        }when AFTER_UPDATE{
            
        }when AFTER_DELETE{
            
        }when AFTER_UNDELETE{
            //Challenge XI Part 1
            AccountTriggerHelper.RestoredRecordTask(trigger.new);
        }
   }
    
}