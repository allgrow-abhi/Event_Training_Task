// pageextension 50124 "Posted Sales Shipment Sub Form" extends "Posted Sales Shpt. Subform"
// {
//     layout
//     {
//         addafter(Description)
//         {
//             field("Project Code"; Rec."Project Code")
//             {
//                 ApplicationArea = all;
//             }
//             field("Item Code"; Rec."Item Code")
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