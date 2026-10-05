codeunit 50113 "Event SubTask 26"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnBeforeValidateEvent, 'Quantity', false, false)]
    local procedure OnBeforeValidateEvent(var Rec: Record "Sales Line")
    var
        ItemRec: Record Item;
        PurchaseHeaderRec: Record "Purchase Header";
        PurchaseLineRec: Record "Purchase Line";
        SalesHeaderRec: Record "Sales Header";
        ItemJournalLineRec: Record "Item Journal Line";
        ItemJournalEntryRec: Codeunit "Item Jnl.-Post Line";
        AvailableQuantity: Decimal;
        ShortageQuantity: Decimal;
        vendorNo: Code[50];
        NextLineNo: Integer;
    begin
        vendorNo := '';
        SalesHeaderRec.Get(Rec."Document Type", Rec."Document No.");
        If SalesHeaderRec."Document Type" = SalesHeaderRec."Document Type"::Order then begin
            if ItemRec.Get(Rec."No.") then begin
                ItemRec.SetAutoCalcFields(Inventory);
                AvailableQuantity := ItemRec.Inventory;
                vendorNo := ItemRec."Vendor No.";
            end;
            if Rec.Quantity > AvailableQuantity then begin
                ShortageQuantity := Rec.Quantity - AvailableQuantity;
                Message('The quantity entered exceeds the available inventory. Available quantity: %1', AvailableQuantity);
                PurchaseHeaderRec.Init();
                PurchaseHeaderRec.Validate("Document Type", PurchaseHeaderRec."Document Type"::Order);
                PurchaseHeaderRec.Validate("Buy-from Vendor No.", vendorNo);
                PurchaseHeaderRec.Insert(true);
                PurchaseHeaderRec.Modify(true);
                NextLineNo := 10000;

                PurchaseLineRec.Init();
                PurchaseLineRec.Validate("Document Type", PurchaseHeaderRec."Document Type");
                PurchaseLineRec.Validate("Document No.", PurchaseHeaderRec."No.");
                PurchaseLineRec.Validate("Line No.", NextLineNo);
                PurchaseLineRec.Validate(Quantity, ShortageQuantity);
                PurchaseLineRec.Validate(Type, PurchaseLineRec.Type::Item);
                PurchaseLineRec.Validate("No.", Rec."No.");
                PurchaseLineRec.Insert(true);
                PurchaseLineRec.Modify(true);
                Message('Purchase Order created for item: %1 with quantity: %2', Rec."No.", Rec.Quantity);
            end;
        end
    end;
}