//Task 2

// tableextension 50125 "Purchase Header Ext." extends "Purchase Header"
// {
//     fields
//     {
//         field(50126; "Vendor code"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Vendor Code';
//         }
//         // Add changes to table fields here
//     }

//     keys
//     {
//         // Add changes to keys here
//     }

//     fieldgroups
//     {
//         // Add changes to field groups here
//     }

//     var
//         myInt: Integer;
// }

//Task 10
tableextension 50125 "Purchase Header Ext." extends "Purchase Header"
{
    fields
    {
        field(50000; "Item Code AS"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Item Code AS';
        }
        // Add changes to table fields here
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}