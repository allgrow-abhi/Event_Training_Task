table 50133 "Overdue Invoice Email"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Customer No"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer No';
        }
        field(2; "Customer Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Name';
        }
        field(3; "Email"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Email';
        }
        field(4; "Invoice No"; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Invoice No.';
        }
        field(5; "Due Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Due Date';
        }
        field(6; "Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Amount';
        }
    }

    keys
    {
        key(PK; "Customer No")
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