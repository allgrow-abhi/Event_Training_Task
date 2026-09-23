codeunit 50134 "Event Sub Task 20"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterPostItemLine, '', false, false)]
    local procedure OnAfterPostSalesItemLine(var SalesLine: Record "Sales Line")
    var
        ItemRec: Record Item;
    begin
        if ItemRec.Get(SalesLine."No.") then begin
            ItemRec."Last Sales Unit Price" := SalesLine."Unit Price";
            ItemRec.Modify();
        end;

        Message('Last Purchase Unit Price: %1', ItemRec."Last Purchase Unit Price");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purch.-Post", OnAfterPostItemLine, '', false, false)]
    local procedure OnAfterPostPurchaseItemLine(PurchaseLine: Record "Purchase Line")
    var
        ItemRec: Record Item;
    begin
        if ItemRec.Get(PurchaseLine."No.") then begin
            ItemRec."Last Purchase Unit Price" := PurchaseLine."Direct Unit Cost";
            ItemRec.Modify();
        end;
        Message('Last Purchase Unit Price: %1', ItemRec."Last Purchase Unit Price");
    end;
}