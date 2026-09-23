//Task 2

// pageextension 50125 "Purchase Order Ext." extends "Purchase Order"
// {
//     layout
//     {
//         addlast(General)
//         {
//             field("Vendor Code"; Rec."Vendor code")
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

//Task 10
// pageextension 50125 "Purchase Order Ext." extends "Purchase Order"
// {
//     layout
//     {
//         addafter("Order Date")
//         {
//             field("Item Code AS"; Rec."Item Code AS")
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

//Task 8

// pageextension 50125 "Purchase Order Ext." extends "Purchase Order"
// {
//     layout
//     {
//         addafter("Order Date")
//         {
//             field("Purchase Vendor Code"; Rec."Purchase Vendor Code")
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


//Task 22

pageextension 50125 "Purchase Order Ext" extends "Purchase Order"
{
    layout
    {
        addafter("Vendor Invoice No.")
        {
            field("Item Category"; Rec."Item Category")
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