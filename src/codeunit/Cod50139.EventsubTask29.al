// codeunit 50139 "Event subTask 29"
// {
//     [EventSubscriber(ObjectType::Table, Database::Customer, OnAfterValidateEvent, 'Credit Limit (LCY)', false, false)]
//     local procedure OnAfterValidateEvent(var Rec: Record Customer; var xRec: Record Customer)
//     var
//         logTableRec: Record "Log Table";
//     begin
//         logTableRec.Init();
//         logTableRec."Old Credit Limit" := xRec."Credit Limit (LCY)";
//         logTableRec."New Credit Limit" := Rec."Credit Limit (LCY)";
//         logTableRec." Date and Time" := CurrentDateTime;
//         logTableRec."User Name" := UserId;
//         logTableRec.Insert(true);

//         Message('OnAfterValidateEvent Runs');
//     end;
// }