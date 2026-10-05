codeunit 50137 "Event subTask 24"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnAfterReleaseSalesDoc, '', false, false)]
    local procedure OnAfterReleaseSalesDoc(var SalesHeader: Record "Sales Header")
    var
        purchaseHeaderRec: Record "Purchase Header";
        PurchaseLineRec: Record "Purchase Line";
        SalesLineRec: Record "Sales Line";
        ItemRec: Record Item;
        vendorNo: Code[50];
        LowestUnitPrice: Decimal;
        NextLineNo: Integer;
    begin
        SalesLineRec.Reset();
        SalesLineRec.SetRange("Document Type", SalesHeader."Document Type");
        SalesLineRec.SetRange("Document No.", SalesHeader."No.");

        vendorNo := '';
        LowestUnitPrice := 999999;
        if SalesLineRec.FindSet() then begin
            repeat
                if ItemRec.Get(SalesLineRec."No.") then begin
                    if ItemRec."Unit Cost" < LowestUnitPrice then begin
                        LowestUnitPrice := ItemRec."Unit Cost";
                        vendorNo := ItemRec."Vendor No.";
                    end;
                end;
            until SalesLineRec.Next() = 0;
        end;

        purchaseHeaderRec.Init();
        purchaseHeaderRec."Document Type" := purchaseHeaderRec."Document Type"::Quote;
        purchaseHeaderRec.Validate("Buy-from Vendor No.", vendorNo);
        purchaseHeaderRec.Insert(true);
        purchaseHeaderRec.Modify(true);

        NextLineNo := 0;

        if SalesLineRec.FindSet() then begin
            repeat
                NextLineNo := NextLineNo + 10000;
                PurchaseLineRec.Init();
                PurchaseLineRec."Document Type" := purchaseHeaderRec."Document Type";
                PurchaseLineRec."Document No." := purchaseHeaderRec."No.";
                PurchaseLineRec."Line No." := NextLineNo;

                PurchaseLineRec.Validate(Type, SalesLineRec.Type::Item);
                PurchaseLineRec.Validate("No.", SalesLineRec."No.");
                PurchaseLineRec.Validate(Quantity, SalesLineRec.Quantity);
                PurchaseLineRec.Insert(true);
            until SalesLineRec.Next() = 0;
            Message('Purchase Quote created for vendor: %1 with lowest unit price: %2', vendorNo, LowestUnitPrice);
        end;
    end;
}
