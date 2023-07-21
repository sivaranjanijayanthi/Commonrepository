trigger accdeltstpcon on Account (before delete) {
    for(account a:[select id from account where id in(select accountid from contact) and id in:trigger.old]){
        trigger.oldMap.get(a.id).addError('acc with cont assocition wont delt');
    }

}