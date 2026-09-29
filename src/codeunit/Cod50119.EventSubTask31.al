codeunit 50119 "Event SubTask 31"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", OnBeforePostPurchLine, '', false, false)]
    local procedure OnBeforePostPurchLine(var PurchLine: Record "Purchase Line"; var PurchHeader: Record "Purchase Header")
    var
        ItemRec: Record Item;
    begin
        if ItemRec.Get(PurchLine."No.") then begin
            if PurchLine.Quantity > ItemRec.Inventory then
                Error('Entered Quantity is Greater than Qty. on Hand');
        end;
    end;
}