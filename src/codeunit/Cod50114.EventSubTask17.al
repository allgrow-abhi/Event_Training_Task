codeunit 50114 "Event SubTask 17"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, 'Quantity', false, false)]
    local procedure OnAfterValidateEvent(var Rec: Record "Sales Line")
    var
        ItemRec: Record Item;
        ItemJnLineRec: Record "Item Journal Line";
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

        if not ItemRec.Get(Rec."No.") then
            exit;

        ItemRec.SetRange("Location Filter", Rec."Location Code");
        ItemRec.CalcFields(Inventory);

        AvailableQuantity := ItemRec.Inventory;
        if Rec.Quantity <= AvailableQuantity then
            exit;
        ShortageQuantity := Rec.Quantity - AvailableQuantity;

        Message(
            'Available Qty = %1, Required Qty = %2, Shortage Qty = %3', AvailableQuantity, Rec.Quantity, ShortageQuantity);

        ItemJnLineRec.Reset();
        ItemJnLineRec.SetRange("Journal Template Name", 'ITEM');
        ItemJnLineRec.SetRange("Journal Batch Name", 'DEFAULT');

        if ItemJnLineRec.FindLast() then
            NextLineNo := ItemJnLineRec."Line No." + 10000
        else
            NextLineNo := 10000;

        ItemJnLineRec.Init();
        ItemJnLineRec.Validate("Journal Template Name", 'ITEM');
        ItemJnLineRec.Validate("Journal Batch Name", 'DEFAULT');
        ItemJnLineRec.Validate("Line No.", NextLineNo);
        ItemJnLineRec.Validate("Posting Date", WorkDate());
        ItemJnLineRec.Validate("Entry Type", ItemJnLineRec."Entry Type"::"Positive Adjmt.");
        ItemJnLineRec.Validate("Document No.", Rec."Document No.");
        ItemJnLineRec.Validate("Item No.", Rec."No.");
        ItemJnLineRec.Validate("Location Code", Rec."Location Code");
        ItemJnLineRec.Validate("Quantity", ShortageQuantity);

        ItemJnLineRec.Insert(true);

        Message('Item Journal Line Created');

        ItemJnPostRec.RunWithCheck(ItemJnLineRec);

        Message('Item Journal Posted Successfully');
    end;
}
