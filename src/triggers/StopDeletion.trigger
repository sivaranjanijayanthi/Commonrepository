trigger StopDeletion on Account (before insert) {
    for(account a:[select id from account where id in (select accountid from contact) and id in: trigger.old]){
        trigger.oldMap.get(a.id).adderror('cannot delete account has contact association');// this is a for loop
    }
}