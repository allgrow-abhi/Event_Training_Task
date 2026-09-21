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

//Task 14

pageextension 50121 "Sales Order SubForm Ext" extends "Sales Order Subform"
{
    layout
    {
        addafter("Shipment Date")
        {
            field("Req. Delivery Date"; Rec."Req. Delivery Date")
            {
                ApplicationArea = all;
            }
        }
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}


