//Task 2

// pageextension 50129 "Purchase INV Ext" extends "Posted Purchase Invoice"
// {
//     layout
//     {
//         addbefore(Control51)
//         {
//             field("Vendor Code"; Rec."Vendor Code")
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