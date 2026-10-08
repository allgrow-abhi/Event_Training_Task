codeunit 50111 "Event SubTask 19"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Qty. to Ship', false, false)]
    local procedure OnAfterValidateEvent(var Rec: Record "Sales Line")
    var
        ReservationEntryRec: Record "Reservation Entry";
        LastReservationEntryRec: Record "Reservation Entry";
        TrackingSpecificationRec: Record "Tracking Specification";
        SalesLineReserve: Codeunit "Sales Line-Reserve";
        ItemRec: Record Item;
        EntryNo: Integer;
    begin
        Message('OnAfterValidate Event Run');
        ReservationEntryRec.Reset();
        ReservationEntryRec.SetRange("Source Type", Database::"Sales Line");
        ReservationEntryRec.SetRange("Source ID", Rec."Document No.");
        ReservationEntryRec.SetRange("Source Ref. No.", Rec."Line No.");
        ReservationEntryRec.SetRange("Reservation Status", ReservationEntryRec."Reservation Status"::Surplus);

        if ReservationEntryRec.FindFirst() then begin
            ReservationEntryRec.Validate("Quantity (Base)", Rec."Qty. to Ship (Base)");
            ReservationEntryRec.Validate(Quantity, Rec."Qty. to Ship");
            ReservationEntryRec.Modify(true);
        end
        else begin
            if LastReservationEntryRec.FindLast() then
                ReservationEntryRec."Entry No." := LastReservationEntryRec."Entry No." + 1
            else
                ReservationEntryRec."Entry No." := 1;
        end;

        ReservationEntryRec.Init();
        ReservationEntryRec.Validate("Entry No.", ReservationEntryRec."Entry No.");
        ReservationEntryRec.Validate("Quantity (Base)", Rec."Qty. to Ship (Base)");
        ReservationEntryRec.Validate(Quantity, Rec."Qty. to Ship");
        ReservationEntryRec.Validate("Reservation Status", ReservationEntryRec."Reservation Status"::Surplus);
        ReservationEntryRec.Validate("Source Type", Database::"Sales Line");
        ReservationEntryRec.Validate("Source Subtype", 1);
        ReservationEntryRec.Validate("Source ID", Rec."Document No.");
        ReservationEntryRec.Validate("Source Ref. No.", Rec."Line No.");
        ReservationEntryRec.Validate("Created By", UserId);
        ReservationEntryRec.Validate("Creation Date", Today);
        ReservationEntryRec.Insert(true);

        Message('Reservation Entry Created');

        if TrackingSpecificationRec.FindLast() then
            TrackingSpecificationRec."Entry No." := TrackingSpecificationRec."Entry No." + 1
        else begin
            TrackingSpecificationRec."Entry No." := 1;
        end;

        SalesLineReserve.InitFromSalesLine(TrackingSpecificationRec, Rec);
        TrackingSpecificationRec.Validate("Lot No.", 'LOT-' + Format(Rec."Line No."));
        TrackingSpecificationRec.Validate("Quantity (Base)", ReservationEntryRec."Quantity (Base)");
        TrackingSpecificationRec.Insert(true);
        Message('Tracking Specification Created: %1', TrackingSpecificationRec."Quantity (Base)");

    end;
}