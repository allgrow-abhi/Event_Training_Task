// codeunit 50117 "Event SubTask 32"
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Purchase Document", OnBeforeReleasePurchaseDoc, '', false, false)]
//     local procedure OnBeforeReleasePurchaseDoc(var PurchaseHeader: Record "Purchase Header")
//     var
//         purchaseLineRec: Record "Purchase Line";
//         isBlank: Boolean;
//     begin
//         isBlank := false;
//         purchaseLineRec.SetRange("Document Type", purchaseHeader."Document Type");
//         purchaseLineRec.SetRange("Document No.", purchaseHeader."No.");
//         if purchaseLineRec.FindSet() then begin
//             repeat
//                 if purchaseLineRec."Item Category" = '' then begin
//                     Error('Item Category Should not be Blank');
//                 end;
//             until purchaseLineRec.Next() = 0;
//         end;
//     end;
// }