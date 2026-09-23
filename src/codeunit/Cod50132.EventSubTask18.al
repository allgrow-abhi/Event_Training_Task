codeunit 50132 "Event Sub Task 18"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnAfterReleaseSalesDoc, '', false, false)]
    local procedure OnAfterReleaseSalesDoc(var SalesHeader: Record "Sales Header")
    var
        LogTableRec: Record "Log Table";
    begin

        LogTableRec."User Name" := UserId;
        LogTableRec.Time := Time;
        LogTableRec.Action := LogTableRec.Action::Release;
        LogTableRec.Insert();
        LogTableRec.Modify();
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnAfterReopenSalesDoc, '', false, false)]
    local procedure OnAfterReopenSalesDoc(var SalesHeader: Record "Sales Header")
    var
        LogTableRec: Record "Log Table";
    begin

        LogTableRec."User Name" := UserId;
        LogTableRec.Time := Time;
        LogTableRec.Action := LogTableRec.Action::Reopen;
        LogTableRec.Insert();
        LogTableRec.Modify();
    end;
}