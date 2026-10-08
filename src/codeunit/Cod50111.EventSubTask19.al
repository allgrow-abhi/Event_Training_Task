codeunit 50111 "Event SubTask 19"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Qty. to Ship', false, false)]
    local procedure OnAfterValidateEvent(var Rec: Record "Sales Line")
    var
        SalesLineReserve: Codeunit "Sales Line-Reserve";
        TrackingSpecification: Record "Tracking Specification";
    begin
        TrackingSpecification.Init();
        if TrackingSpecification.FindLast() then
            TrackingSpecification."Entry No." := TrackingSpecification."Entry No." + 1
        else
            TrackingSpecification."Entry No." := 1;
        SalesLineReserve.InitFromSalesLine(TrackingSpecification, Rec);
        TrackingSpecification.Validate("Lot No.", 'LOT-' + Format(Rec."Line No."));
        TrackingSpecification.Validate("Quantity (Base)", Rec."Qty. to Ship (Base)");
        TrackingSpecification.Insert(true);
    end;
}