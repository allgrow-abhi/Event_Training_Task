// pageextension 50127 "Purchase Order Subform Ext" extends "Purchase Order Subform"
// {
//     layout
//     {
//         addafter(Description)
//         {
//             field("Item Category"; Rec."Item Category")
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