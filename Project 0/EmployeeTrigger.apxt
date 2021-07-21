/*
//////////////////////////////////////////////////
//
//  Name: EmployeeTrigger
//  Author: Dominic Romanello
//  Created Date: 7/21/21
//  Modified Date: 7/21/21
//  Description: A trigger on the Employee object to respond to changes to the records
//  	in the Organization.
//  
//
/////////////////////////////////////////////////
*/

trigger EmployeeTrigger on Employee__c (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    
    Switch on Trigger.OperationType{
        When BEFORE_INSERT{
            EmployeeTriggerHelper.PreventZombie(Trigger.new);
            EmployeeTriggerHelper.CheckForDuplicatePhones(Trigger.new);
        }When BEFORE_UPDATE{
			            
        }When BEFORE_DELETE{
            
        }When AFTER_INSERT{
            
        }When AFTER_UPDATE{
            
        }When AFTER_DELETE{
            
        }When AFTER_UNDELETE{
            EmployeeTriggerHelper.RestoredRecordTask(trigger.old);
        }
    }
}