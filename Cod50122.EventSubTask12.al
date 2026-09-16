codeunit 50122 "Event Sub Task 12"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterInitHeaderDefaults, '', false, false)]
    local procedure OnAfterInitHeaderDefaults(var SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header")
    begin
        if SalesHeader.Delivery <> '' then begin
            SalesLine.Delivery := SalesHeader.Delivery;
            Message('OnAfterInitHeaderDefaults Event Runs AS');
        end;
    end;
}