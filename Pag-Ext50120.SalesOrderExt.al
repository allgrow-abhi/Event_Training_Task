
// Task 7
// pageextension 50120 "Sales Order Ext" extends "Sales Order"
// {
//     layout
//     {
//         addlast(General)
//         {
//             field("Delivery"; Rec.Delivery)
//             {
//                 ApplicationArea = all;
//             }
//         }
//         // Add changes to page layout here
//     }

//     actions
//     {
//         // Add changes to page actions here
//     }

//     var
//         myInt: Integer;
// }


//Task 9
// pageextension 50120 "Sales Order Ext" extends "Sales Order"
// {
//     layout
//     {
//         addafter("Campaign No.")
//         {
//             field("Sales Code"; Rec."Sales Code")
//             {
//                 ApplicationArea = all;
//             }
//         }
//         // Add changes to page layout here
//     }

//     actions
//     {
//         // Add changes to page actions here
//     }

//     var
//         myInt: Integer;
// }