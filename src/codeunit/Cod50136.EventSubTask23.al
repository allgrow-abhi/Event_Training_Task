// codeunit 50136 "Event SubTask 23"
// {
//     [EventSubscriber(ObjectType::Page, Page::"Purchase Order", OnAfterActionEvent, 'Release', false, false)]
//     local procedure OnAfterActionEvent(var rec: Record "Purchase Header")
//     var
//         purchPostRec: Codeunit "Purch.-Post";
//     begin
//         rec.Receive := true;
//         rec.Invoice := false;
//         purchPostRec.Run(rec);
//     end;
// }