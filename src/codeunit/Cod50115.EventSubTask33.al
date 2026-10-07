// codeunit 50115 "Event SubTask 33"
// {
//     [EventSubscriber(ObjectType::Page, Page::"Overdue Invoice Email", OnOpenPageEvent, '', false, false)]
//     local procedure OnOpenPageEvent(var Rec: Record Customer)
//     var
//         SetUp: Record "SetUp Page";
//     begin
//         if not SetUp.Get('SETUP') then begin
//             SetUp.Init();
//             SetUp."Entry No." := 'SETUP';
//             SetUp.Insert();
//         end;
//     end;
// }