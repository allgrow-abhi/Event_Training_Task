// codeunit 50137 "Event subTask 24"
// {
//     [EventSubscriber(ObjectType::Page, Page::"Sales Order", OnAfterActionEvent, 'Release', false, false)]
//     local procedure OnAfterActionEvent(var Rec: Record "Sales Header")
//     var
//         purchaseHeaderRec: Record "Purchase Header";
//         PurchaseLineRec: Record "Purchase Line";
//         SalesLineRec: Record "Sales Line";
//         ItemRec: Record Item;
//         vendorNo: Code[50];
//         LowestUnitPrice: Decimal;
//         LineNo: Integer;
//     begin
//         SalesLineRec.Reset();
//         SalesLineRec.SetRange("Document Type", Rec."Document Type");
//         SalesLineRec.SetRange("Document No.", Rec."No.");

//         vendorNo := '';
//         LowestUnitPrice := 999999;
//         if SalesLineRec.FindSet() then begin
//             repeat
//                 if ItemRec.Get(SalesLineRec."No.") then begin
//                     if ItemRec."Unit Cost" < LowestUnitPrice then begin
//                         LowestUnitPrice := ItemRec."Unit Cost";
//                         vendorNo := ItemRec."Vendor No.";
//                     end;
//                 end;
//             until SalesLineRec.Next() = 0;
//         end;

//         if vendorNo = '' then begin
//             Message('Vendor is blank %1', vendorNo);
//         end;

//         purchaseHeaderRec.Init();
//         purchaseHeaderRec."Document Type" := purchaseHeaderRec."Document Type"::Quote;
//         purchaseHeaderRec.Insert(true);

//         purchaseHeaderRec.Validate("Buy-from Vendor No.", vendorNo);
//         purchaseHeaderRec.Modify(true);

//         LineNo := 0;

//         if SalesLineRec.FindSet() then begin
//             repeat
//                 LineNo := LineNo + 10000;
//                 PurchaseLineRec.Init();
//                 PurchaseLineRec."Document Type" := purchaseHeaderRec."Document Type";
//                 PurchaseLineRec."Document No." := purchaseHeaderRec."No.";
//                 PurchaseLineRec."Line No." := LineNo;

//                 PurchaseLineRec.Validate(Type, SalesLineRec.Type::Item);
//                 PurchaseLineRec.Validate("No.", SalesLineRec."No.");
//                 PurchaseLineRec.Validate(Quantity, SalesLineRec.Quantity);
//                 PurchaseLineRec.Insert(true);
//             until SalesLineRec.Next() = 0;
//         end;
//     end;
// }