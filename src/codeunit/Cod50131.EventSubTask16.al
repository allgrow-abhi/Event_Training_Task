// codeunit 50131 "Event Sub Task 16"
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforeReleaseSalesDocument, '', false, false)]
//     local procedure OnBeforePostSalesDoc(SalesHeader: Record "Sales Header")
//     begin
//         if SalesHeader.Doc
//     end;
// }