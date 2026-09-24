codeunit 50137 "Event subTask 24"
{
    [EventSubscriber(ObjectType::Page, Page::"Sales Order", OnAfterActionEvent, 'Release', false, false)]
    local procedure OnAfterActionEvent(var Rec: Record "Sales Header")
    var
        purchaseHeaderRec: Record "Purchase Header";
        PurchaseLineRec: Record "Purchase Line";
        SalesLineRec: Record "Sales Line";
    begin
        purchaseHeaderRec.Init();
        purchaseHeaderRec."Document Type" := purchaseHeaderRec."Document Type"::Quote;
        purchaseHeaderRec.Insert(true);
        SalesLineRec.SetRange("Document Type", Rec."Document Type");
        SalesLineRec.SetRange("No.", Rec."No.");
    end;
}