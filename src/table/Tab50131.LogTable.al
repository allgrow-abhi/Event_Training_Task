table 50131 "Log Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "User Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'User Name';
        }
        field(3; "Time"; Time)
        {
            DataClassification = ToBeClassified;
            Caption = 'Time';
        }
        field(4; "Action"; Option)
        {
            DataClassification = ToBeClassified;
            Caption = 'Action';
            OptionMembers = Release,Reopen;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}