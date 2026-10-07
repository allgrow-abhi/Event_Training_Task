codeunit 50114 "Event SubTask 17"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, 'Quantity', false, false)]
    local procedure OnAfterValidateEvent(var Rec: Record "Sales Line")
    var
        ItemRec: Record Item;
        ItemJnLineRec: Record "Item Journal Line";
        ItemJnPostRec: Codeunit "Item Jnl.-Post Line";
        ItemJnTemplateRec: Record "Item Journal Template";
        ItemJnBatchRec: Record "Item Journal Batch";
        JournalTemplateName: Code[20];
        JournalBatchName: Code[20];
        value: Integer;
        AvailableQuantity: Decimal;
        ShortageQuantity: Decimal;
        NextLineNo: Integer;
    begin
        // Message('OnAfterValidateEvent Runs');
        // Message('1');
        value := 1;
        // Message('2');
        if ItemJnTemplateRec.FindLast() then begin
            value := value + 1;
            JournalTemplateName := 'ItemAB' + Format(value);
            JournalBatchName := 'DefaultAB' + Format(value);
            if not ItemJnTemplateRec.Get(JournalTemplateName) then begin
                ItemJnTemplateRec.Init();
                ItemJnTemplateRec.Name := JournalTemplateName;
                ItemJnTemplateRec.Insert();
            end;
            if not ItemJnBatchRec.Get(JournalTemplateName, JournalBatchName) then begin
                ItemJnBatchRec.Init();
                ItemJnBatchRec."Journal Template Name" := JournalTemplateName;
                ItemJnBatchRec.Name := JournalBatchName;
                ItemJnBatchRec.Insert();
            end;
        end;
        // Message('3');
        if Rec.Type <> Rec.Type::Item then
            exit;
        // Message('4');
        if Rec."No." = '' then
            exit;
        // Message('5');
        if not ItemRec.Get(Rec."No.") then
            exit;
        // Message('6');
        ItemRec.SetRange("Location Filter", Rec."Location Code");
        // Message('7');
        ItemRec.CalcFields(Inventory);
        // Message('8');
        AvailableQuantity := ItemRec.Inventory;
        // Message('9');
        if Rec.Quantity > AvailableQuantity then
            ShortageQuantity := Rec.Quantity - AvailableQuantity
        else
            exit;
        Message(
            'Available Qty = %1, Required Qty = %2, Shortage Qty = %3', AvailableQuantity, Rec.Quantity, ShortageQuantity);
        ItemJnLineRec.Reset();
        // ItemJnLineRec.SetRange("Journal Template Name", JournalTemplateName);
        // ItemJnLineRec.SetRange("Journal Batch Name", JournalBatchName);

        if ItemJnLineRec.FindLast() then
            NextLineNo := ItemJnLineRec."Line No." + 10000
        else
            NextLineNo := 10000;

        ItemJnLineRec.Init();
        ItemJnLineRec.Validate("Journal Template Name", JournalTemplateName);
        ItemJnLineRec.Validate("Journal Batch Name", JournalBatchName);
        ItemJnLineRec.Validate("Line No.", NextLineNo);
        ItemJnLineRec.Validate("Posting Date", Today());
        ItemJnLineRec.Validate("Entry Type", ItemJnLineRec."Entry Type"::"Positive Adjmt.");
        ItemJnLineRec.Validate("Document No.", Rec."Document No.");
        ItemJnLineRec.Validate("Item No.", Rec."No.");
        ItemJnLineRec.Validate("Location Code", Rec."Location Code");
        ItemJnLineRec.Validate("Quantity", ShortageQuantity);

        ItemJnLineRec.Insert(true);
        ItemJnPostRec.RunWithCheck(ItemJnLineRec);
    end;
}