codeunit 50135 "Event SubTask 22"
{
    [EventSubscriber(ObjectType::Table, Database::"Purchase Line", OnAfterValidateEvent, 'Type', false, false)]
    local procedure OnAfterValidateEvent(var Rec: Record "Purchase Line")
    var
        PurchaseHeaderRec: Record "Purchase Header";
    begin
        if Rec.Type = Rec.Type::Item then begin
            if PurchaseHeaderRec.Get(Rec."Document Type", Rec."Document No.") then begin
                Rec."Item Category" := PurchaseHeaderRec."Item Category";
                Rec.Insert();
            end;
        end;
        Message('Item Category:%1', Rec."Item Category");
    end;
}