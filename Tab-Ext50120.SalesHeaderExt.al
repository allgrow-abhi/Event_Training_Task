//Task 7

// tableextension 50120 "Sales Header Ext" extends "Sales Header"
// {
//     fields
//     {
//         field(50000; "Delivery"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Delivery';
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


// Task 9
tableextension 50120 "Sales Header Ext" extends "Sales Header"
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