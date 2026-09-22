codeunit 50131 "Event Sub Task 16"
{

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnBeforeReleaseSalesDoc, '', false, false)]
    local procedure OnBeforeReleaseSalesDoc(var SalesHeader: Record "Sales Header")
    var
        DocumentAttachmentRec: Record "Document Attachment";
    begin
        Message('OnBeforeReleaseSalesDocument runs');
        DocumentAttachmentRec.SetRange("Table ID", Database::"Sales Header");
        DocumentAttachmentRec.SetRange("No.", SalesHeader."No.");
        if not DocumentAttachmentRec.FindFirst() then begin
            Error('It can not be released without attachment')
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforePostSalesDoc, '', false, false)]
    local procedure OnBeforePostSalesDoc(SalesHeader: Record "Sales Header")
    var
        DocumentAttachmentRec: Record "Document Attachment";
    begin
        Message('OnBeforePostSalesDoc runs');
        DocumentAttachmentRec.SetRange("Table ID", Database::"Sales Header");
        DocumentAttachmentRec.SetRange("No.", SalesHeader."No.");
        if not DocumentAttachmentRec.FindFirst() then begin
            Error('It can not be posted without attachment')
        end;
    end;
}