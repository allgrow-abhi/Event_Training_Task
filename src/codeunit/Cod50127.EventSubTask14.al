codeunit 50127 "Event Sub Task 14"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnBeforeValidateEvent, 'Req. Delivery Date', false, false)]
    local procedure OnAfterInitType(var Rec: Record "Sales Line")
    begin
        if Rec."Req. Delivery Date" <= Today then begin
            Error('Date is Out of Range');
        end;
        Rec."Shipment Date" := Rec."Req. Delivery Date" - 2;
    end;
}