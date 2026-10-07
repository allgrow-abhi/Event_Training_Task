// table 50132 "SetUp Page"
// {
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; "Entry No."; Code[50])
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Entry No.';
//         }
//         field(2; "Start Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Start Date';
//         }
//         field(3; "End Date"; Date)
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'End Date';
//         }
//     }

//     keys
//     {
//         key(PK; "Entry No.")
//         {
//             Clustered = true;
//         }
//     }

//     fieldgroups
//     {
//         // Add changes to field groups here
//     }

//     var
//         myInt: Integer;

//     trigger OnInsert()
//     begin

//     end;

//     trigger OnModify()
//     begin

//     end;

//     trigger OnDelete()
//     begin

//     end;

//     trigger OnRename()
//     begin

//     end;

// }