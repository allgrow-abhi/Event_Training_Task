// page 50132 "SetUp Page AS"
// {
//     PageType = List;
//     ApplicationArea = All;
//     UsageCategory = Administration;
//     SourceTable = "SetUp Page";

//     layout
//     {
//         area(Content)
//         {
//             repeater(GroupName)
//             {
//                 field("Start Date"; Rec."Start Date")
//                 {
//                     ApplicationArea = all;
//                 }
//                 field("End Date"; Rec."End Date")
//                 {
//                     ApplicationArea = all;
//                 }
//             }
//         }
//     }

//     actions
//     {
//         area(Processing)
//         {
//             action(ActionName)
//             {

//                 trigger OnAction()
//                 begin

//                 end;
//             }
//         }
//     }

//     trigger OnOpenPage()
//     begin
//         if Rec."Entry No." = '' then begin
//             Rec."Entry No." := 'SETUP';
//             Rec.Insert();
//         end;
//     end;
// }