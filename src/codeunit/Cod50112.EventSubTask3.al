codeunit 50112 "Event SubTask 3"
{
    [EventSubscriber(ObjectType::Table, Database::"Default Dimension", OnAfterInsertEvent, '', false, false)]
    local procedure OnAfterInsert(var rec: Record "Default Dimension")
    var
        EmployeeRec: Record Employee;
    begin
        if rec."Table ID" = DATABASE::Employee then begin
            if EmployeeRec.Get(rec."No.") then begin
                EmployeeRec.Validate("Dimension Code", rec."Dimension Code");
                EmployeeRec.Modify();
            end;
        end;
        Message('Default Dimension has been inserted and Employee record updated successfully.');
    end;

    [EventSubscriber(ObjectType::Table, Database::"Default Dimension", OnAfterDeleteEvent, '', false, false)]
    local procedure OnAfterDeleteEvent(var rec: Record "Default Dimension")
    var
        EmployeeRec: Record Employee;
    begin
        if rec."Table ID" = DATABASE::Employee then begin
            if EmployeeRec.Get(rec."No.") then begin
                EmployeeRec.Validate("Dimension Code", '');
                EmployeeRec.Modify();
            end;
        end;
        Message('Default Dimension has been deleted and Employee record updated successfully.');
    end;
}