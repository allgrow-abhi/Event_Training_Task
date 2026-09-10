codeunit 50129 "Event Sub"
{
    [EventSubscriber(ObjectType::Table, Database::Customer, OnAfterValidateEvent, 'Name', false, False)]
    local procedure OnAfterInsertEvent(var Rec: Record Customer)
    begin
        Message('New Customer Name is Inserted AS %1', rec.Name);
    end;


}