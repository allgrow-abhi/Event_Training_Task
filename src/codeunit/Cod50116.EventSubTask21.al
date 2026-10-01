// codeunit 50116 "Event SubTask 21"
// {
//     [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnBeforeTestStatusOpen, '', true, true)]
//     local procedure OnBeforeTestStatusOpen(var SalesLine: Record "Sales Line"; var SalesHeader: Record "Sales Header"; var IsHandled: Boolean)
//     var
//         ReleaseSalesDoc: Codeunit "Release Sales Document";
//     begin
//         if SalesLine."Document Type" = SalesLine."Document Type"::Order then begin
//             if SalesHeader.Status = SalesHeader.Status::Released then begin
//                 ReleaseSalesDoc.Reopen(SalesHeader);
//                 isHandled := true;
//             end
//         end
//     end;

//     [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, 'Quantity', false, false)]
//     local procedure OnAfterModify(var Rec: Record "Sales Line")
//     var
//         SalesHeader: Record "Sales Header";
//         ReleaseSalesDoc: Codeunit "Release Sales Document";
//     begin
//         if rec.Quantity = 0 then
//             exit;
//         if not SalesHeader.Get(Rec."Document Type", Rec."Document No.") then
//             exit;
//         if SalesHeader."Document Type" <> SalesHeader."Document Type"::Order then
//             exit;

//         if SalesHeader.Status = SalesHeader.Status::Open then begin
//             ReleaseSalesDoc.ReleaseSalesHeader(SalesHeader, false);
//         end;
//     end;
// }


// codeunit 50116 "Event SubTask 21"
// {
//     SingleInstance = true;

//     var
//         IsAutoReopen: Boolean;
//         ReleasedDocumentNo: Code[20];

//     [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnBeforeValidateEvent', 'Quantity', false, false)]
//     local procedure PurchaseLineOnBeforeValidateEvent(var Rec: Record "Purchase Line")
//     var
//         PurchHeader: Record "Purchase Header";
//         ReleasePurchDoc: Codeunit "Release Purchase Document";
//     begin
//         if Rec."Document Type" <> Rec."Document Type"::Order then
//             exit;
//         if not PurchHeader.Get(Rec."Document Type", Rec."Document No.") then
//             exit;
//         if PurchHeader.Status = PurchHeader.Status::Released then begin
//             IsAutoReopen := true;
//             ReleasedDocumentNo := PurchHeader."No.";
//             ReleasePurchDoc.Reopen(PurchHeader);
//         end
//     end;


//     [EventSubscriber(ObjectType::Table, Database::"Purchase Line", 'OnAfterModifyEvent', '', false, false)]
//     local procedure PurchaseLineOnAfterModify(var Rec: Record "Purchase Line")
//     var
//         PurchHeader: Record "Purchase Header";
//         ReleasePurchDoc: Codeunit "Release Purchase Document";
//     begin
//         if not IsAutoReopen then
//             exit;
//         if Rec."Document Type" <> Rec."Document Type"::Order then
//             exit;
//         if Rec."Document No." <> ReleasedDocumentNo then
//             exit;
//         ReleasedDocumentNo := '';
//         if not PurchHeader.Get(Rec."Document Type", Rec."Document No.") then begin
//             exit;
//         end;
//         if PurchHeader.Status = PurchHeader.Status::Open then
//             ReleasePurchDoc.ReleasePurchaseHeader(PurchHeader, false);
//     end;
// }