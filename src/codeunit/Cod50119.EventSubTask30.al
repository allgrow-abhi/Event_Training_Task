// codeunit 50119 "Event SubTask 30"
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforePostSalesDoc, '', false, false)]
//     local procedure OnBeforePostSalesDoc(SalesHeader: Record "Sales Header")
//     var
//         customerRec: Record Customer;
//         SalesLineRec: Record "Sales Line";
//         TotalDueAmount: Decimal;
//         OrderAmount: Decimal;
//     begin
//         TotalDueAmount := 0;
//         if (SalesHeader."Document Type" = SalesHeader."Document Type"::Order) and (SalesHeader.Status = SalesHeader.Status::Open) then begin
//             if customerRec.Get(SalesHeader."Sell-to Customer No.") then begin
//                 customerRec.CalcFields("Balance Due");
//                 SalesLineRec.SetRange("Document Type", SalesHeader."Document Type");
//                 SalesLineRec.SetRange("Document No.", SalesHeader."No.");
//                 if SalesLineRec.FindSet() then begin
//                     OrderAmount := OrderAmount + SalesLineRec.Amount;
//                 end;
//                 TotalDueAmount := OrderAmount + customerRec."Balance Due";
//             end;

//             if TotalDueAmount > customerRec."Credit Limit (LCY)" then begin
//                 Error('Your Total Due Amount is Greater than Credit Limit');
//             end;
//         end;
//     end;

// }