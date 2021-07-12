Challenge X

Create a trigger on the account object, it should follow all best practices. 

Opportunities represent potential deals with our clients and we do not want to delete 
any accounts which have opportunities whose stage is not 'Closed Won' or 'Closed Lost'. 
If a account is found to have active opportunities we should prevent its deletion with a 
message that provides an explanation on why it cannot be deleted.

We've recently determined that California is no longer a profitable locale to operate our 
specific business in. As such we are no longer accepting new accounts whose location is in California. 
Ensure that any new accounts are prohibited from being created if that is their home location 
with a appropriate message detailing why.

Any account who has no related contact should have a generic placeholder created 
from the accounts data and related to it.