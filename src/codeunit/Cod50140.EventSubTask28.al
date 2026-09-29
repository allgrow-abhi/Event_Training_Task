// codeunit 50140 "Event Sub Task 28"
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforeSalesShptHeaderInsert, '', false, false)]
//     local procedure OnBeforeSalesShptHeaderInsert(var SalesShptHeader: Record "Sales Shipment Header"; SalesHeader: Record "Sales Header")
//     begin
//         SalesShptHeader."Sales Code" := SalesHeader."Sales Code";
//     end;
// }