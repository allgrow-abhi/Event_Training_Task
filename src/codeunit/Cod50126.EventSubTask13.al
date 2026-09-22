codeunit 50126 "Event Sub Task 13"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforePostSalesDoc, '', false, false)]
    local procedure OnBeforePostSalesDoc(var SalesHeader: Record "Sales Header")
    var
        customerLedgerEntry: Record "Cust. Ledger Entry";
        overdueAmount: Decimal;
        overdueInvoices: Integer;
        AccessControlRec: Record "Access Control";
        isUserSuper: Boolean;
    begin
        Message('OnBeforePostSalesDoc event triggered');
        overdueAmount := 0;
        overdueInvoices := 0;
        customerLedgerEntry.Reset();
        customerLedgerEntry.SetRange("Customer No.", SalesHeader."Sell-to Customer No.");
        customerLedgerEntry.SetRange("Document Type", SalesHeader."Document Type"::Invoice);
        customerLedgerEntry.SetFilter("Due Date", '<%1', Today);
        // customerLedgerEntry.SetRange(Open, true);
        customerLedgerEntry.SetAutoCalcFields("Remaining Amount");
        if customerLedgerEntry.FindSet() then
            repeat
                Message('Overdue Amount %1, OverdueInvoices %2', overdueAmount, overdueInvoices);
                overdueAmount := overdueAMount + customerLedgerEntry."Remaining Amount";
                overdueInvoices := OverdueInvoices + 1;
            until customerLedgerEntry.Next() = 0;

        AccessControlRec.SetRange("User Security ID", UserSecurityId());
        AccessControlRec.SetRange("Role ID", 'SUPER');
        isUserSuper := AccessControlRec.FindFirst();

        if (overdueAmount > 10000) or (overdueInvoices > 3) then begin
            if not isUserSuper then begin
                Error('you are blocked');
            end;
        end;
    end;
}
