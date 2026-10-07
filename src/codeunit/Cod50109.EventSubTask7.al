// codeunit 50109 "Event Sub Task 7"
// {
//     [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterInsertEvent, '', false, false)]
//     local procedure OnAfterInsertEvent(var rec: Record "Sales Header")
//     var
//         SalesPersonRec: Record "Salesperson/Purchaser";
//         SalesHeaderRec: Record "Sales Header";
//         SalesInvHeader: Record "Sales Invoice Header";
//         TotalOrder: Integer;
//         TotalInvoice: Integer;
//         TotalSum: Integer;
//         MinCount: Integer;
//         MinSalesPersonCode: Code[20];
//     begin
//         MinCount := 999999;
//         TotalOrder := 0;
//         TotalInvoice := 0;
//         if SalesPersonRec.FindSet() then begin
//             repeat
//                 SalesHeaderRec.Reset();
//                 SalesHeaderRec.SetRange("Document Type", rec."Document Type"::Order);
//                 SalesHeaderRec.SetRange("Salesperson Code", SalesPersonRec.Code);

//                 if SalesHeaderRec.FindSet() then begin
//                     repeat
//                         TotalOrder := TotalOrder + 1;
//                     until SalesHeaderRec.Next() = 0;
//                 end;

//                 SalesInvHeader.Reset();
//                 if SalesInvHeader.FindSet() then begin
//                     repeat
//                         TotalInvoice := TotalInvoice + 1;
//                     until SalesInvHeader.Next() = 0;
//                 end;

//                 TotalSum := TotalOrder + TotalInvoice;
//                 if TotalSum < MinCount then begin
//                     MinCount := TotalSum;
//                     MinSalesPersonCode := SalesPersonRec.Code;
//                 end;

//             until SalesPersonRec.Next() = 0;
//         end;
//         rec."Salesperson Code" := MinSalesPersonCode;
//         Message('OnAfterInsertEvent runs');
//         Message('Minimum Sales Person Code: %1', rec."Salesperson Code");
//     end;
// }