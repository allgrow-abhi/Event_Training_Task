codeunit 50114 "Event SubTask 17"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, 'Quantity', false, false)]
    local procedure OnAfterValidateEvent(var Rec: Record "Sales Line")
    var
        itemRec: Record Item;
        itemJnLineRec: Record "Item Journal Line";
        ItemJnPostRec: Codeunit "Item Jnl.-Post Line";
        AvailableQuantity: Decimal;
        ShortageQuantity: Decimal;
        NextLineNo: Integer;
    begin

        if Rec.Type <> Rec.Type::Item then
            exit;
        if Rec."No." = '' then
            exit;
        if Rec."Location Code" = '' then
            exit;
        if Rec.Quantity = 0 then
            exit;
        NextLineNo := 10000;
        ItemRec.Get(Rec."No.");
        ItemRec.SetRange("Location Filter", Rec."Location Code");
        ItemRec.SetAutoCalcFields(Inventory);

        AvailableQuantity := ItemRec.Inventory;

        if AvailableQuantity >= Rec.Quantity then begin
            exit;
            ShortageQuantity := Rec.Quantity - AvailableQuantity;
            ItemJnLineRec.Reset();
            ItemJnLineRec.SetRange("Journal Template Name", 'ITEM');
            ItemJnLineRec.SetRange("Journal Batch Name", 'DEFAULT');
            if ItemJnLineRec.FindLast() then begin
                NextLineNo := ItemJnLineRec."Line No." + 10000;
            end
            else
                nextLineNo := 10000;
            ItemJnLineRec.Init();
            ItemJnLineRec.Validate("Journal Template Name", 'ITEM');
            ItemJnLineRec.Validate("Journal Batch Name", 'DEFAULT');
            ItemJnLineRec.Validate("Line No.", NextLineNo);
            ItemJnLineRec.Validate("Posting Date", workDate());
            ItemJnLineRec.Validate("Entry Type", ItemJnLineRec."Entry Type"::"Positive Adjmt.");
            ItemJnLineRec.Validate("Document No.", Rec."Document No.");
            ItemJnLineRec.Validate("Item No.", Rec."No.");
            ItemJnLineRec.Validate("Location Code", Rec."Location Code");
            ItemJnLineRec.Validate("Quantity", ShortageQuantity);
            ItemJnLineRec.Insert(true);
            ItemJnPostRec.RunWithCheck(ItemJnLineRec);
            Message('Item Journal Line created for shortage quantity: %1', ShortageQuantity);
        end;
    end;
}