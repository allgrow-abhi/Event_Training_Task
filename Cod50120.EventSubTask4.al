// codeunit 50120 "Event Sub Task 4"
// {
//     [EventSubscriber(ObjectType::Table, DataBase::"Sales Header", OnAfterInitRecord, '', false, false)]
//     local procedure OnAfterInitRecord(var SalesHeader: Record "Sales Header")
//     begin
//         SalesHeader."Shipment Date" := 0D;
//         Message('OnAfterInitRecord runs AS');
//     end;
// }