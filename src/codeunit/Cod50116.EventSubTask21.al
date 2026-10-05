codeunit 50116 "Event SubTask 21"
{
    var
        IsAutoReopen: Boolean;
        ReleasedDocumentNo: Code[20];

    [EventSubscriber(ObjectType::table, Database::"Purchase Line", 'OnBeforeValidateEvent', 'Quantity', false, false)]
    local procedure PurchaseLineOnBeforeValidateEvent(var Rec: Record "Purchase Line")
    var
        PurchHeader: Record "Purchase Header";
        ReleasePurchDoc: Codeunit "Release Purchase Document";
    begin
        if Rec."Document Type" = Rec."Document Type"::Order then
            if PurchHeader.Get(Rec."Document Type", Rec."Document No.") then
                if PurchHeader.Status = PurchHeader.Status::Released then begin
                    IsAutoReopen := true;
                    ReleasedDocumentNo := PurchHeader."No.";
                    ReleasePurchDoc.Reopen(PurchHeader);
                    Message('Purchase Order has been reopened.');
                end;

    end;


    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterModifyEvent', '', false, false)]
    local procedure PurchaseLineOnAfterModify(var Rec: Record "Purchase Line")
    var
        PurchHeader: Record "Purchase Header";
        ReleasePurchDoc: Codeunit "Release Purchase Document";
    begin
        if not IsAutoReopen then
            exit;
        IsAutoReopen := false;
        if Rec."Document Type" <> Rec."Document Type"::Order then
            exit;
        if Rec."Document No." <> ReleasedDocumentNo then
            exit;
        if not PurchHeader.Get(Rec."Document Type", Rec."Document No.") then
            exit;

        ReleasedDocumentNo := '';
        if PurchHeader.Status = PurchHeader.Status::Open then
            ReleasePurchDoc.ReleasePurchaseHeader(PurchHeader, false);
    end;
}