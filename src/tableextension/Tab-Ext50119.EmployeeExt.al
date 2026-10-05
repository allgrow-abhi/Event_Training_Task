tableextension 50119 "Employee Ext" extends Employee
{
    fields
    {
        field(50000; "Dimension Code"; Code[50])
        {
            DataClassification = TobeClassified;
            Caption = 'Dimension Code';
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