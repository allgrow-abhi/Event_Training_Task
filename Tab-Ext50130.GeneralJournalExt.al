// tableextension 50130 "General Journal Ext" extends "Gen. Journal Line"
// {
//     fields
//     {
//         field(50000; "Vendor Code"; Code[20])
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

tableextension 50130 "General Journal Ext" extends "Gen. Journal Line"
{
    fields
    {
        field(50000; "Sales Code"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Sales Code';
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