// table 50131 "Log Table"
// {
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; "Entry No."; Integer)
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Entry No.';
//             AutoIncrement = true;
//         }
//         field(2; "User Name"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'User Name';
//         }
//         field(3; "Time"; Time)
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Time';
//         }
//         field(4; "Action"; Option)
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Action';
//             OptionMembers = Release,Reopen;
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


//Task 29

// table 50131 "Log Table"
// {
//     DataClassification = ToBeClassified;

//     fields
//     {
//         field(1; "Entry No."; Integer)
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Entry No.';
//             AutoIncrement = true;
//         }
//         field(2; "Old Credit Limit"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Old Credit Limit';
//         }
//         field(3; "New Credit Limit"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'New Credit Limit';
//         }
//         field(4; " Date and Time"; DateTime)
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Date and Time';
//         }
//         field(5; "User Name"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'User Name';
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