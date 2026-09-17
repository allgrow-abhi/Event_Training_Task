// Task 7

// pageextension 50121 SalesOrderSubFormExt extends "Sales Order Subform"
// {
//     layout
//     {
//         addafter(Description)
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