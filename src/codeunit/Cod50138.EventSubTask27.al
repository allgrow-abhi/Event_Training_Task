codeunit 50138 "Event SubTask 27"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforeSalesInvLineInsert, '', false, false)]
    local procedure OnBeforeSalesInvLineInsert(var SalesInvLine: Record "Sales Invoice Line"; SalesLine: Record "Sales Line")
    var
        SalesLineRec: Record "Sales Line";
    begin
        SalesLineRec.SetRange("Document Type", SalesLine."Document Type");
        SalesLineRec.SetRange("Document No.", SalesLine."Document No.");
        if SalesLineRec.FindLast() then begin
            if SalesLine."Line No." = SalesLineRec."Line No." then
                SalesInvLine.Description := SalesLine.Description + 'Abhishek';
        end;
    end;
}