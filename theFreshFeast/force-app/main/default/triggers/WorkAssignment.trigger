trigger WorkAssignment on WorkOrder (before insert) {
    WorkAssignment_Helper.myMethod(Trigger.new);
}