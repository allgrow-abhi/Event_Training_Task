// codeunit 50104 "ASTask 19"
// {
//     [EventSubscriber(ObjectType::Table, Database::"Sales Line", OnAfterValidateEvent, "Qty. to Ship", true, true)]
//     local procedure InsertManualReservation(var Rec: Record "Sales Line"; xRec: Record "Sales Line")
//     var
//         ResEntry: Record "Reservation Entry";
//         ItemRec: Record Item;
//         EntryNo: Integer;
//     begin
//         if Rec."Qty. to Ship" = xRec."Qty. to Ship" then
//             exit;

//         if Rec.Type <> Rec.Type::Item then
//             exit;

//         if not ItemRec.Get(Rec."No.") then
//             exit;

//         if ItemRec."Item Tracking Code" = '' then
//             Error('BR %1', ItemRec."No.");


//         ResEntry.Reset();
//         ResEntry.SetRange("Source Type", Database::"Sales Line");
//         ResEntry.SetRange("Source ID", Rec."Document No.");
//         ResEntry.SetRange("Source Ref. No.", Rec."Line No.");
//         ResEntry.SetRange("Item No.", Rec."No.");
//         ResEntry.SetRange("Location Code", Rec."Location Code");
//         ResEntry.SetRange("Reservation Status", ResEntry."Reservation Status"::Surplus);

//         if ResEntry.FindFirst() then begin
//             ResEntry.Validate("Quantity (Base)", Rec."Qty. to Ship (Base)");
//             ResEntry.Validate("Quantity", Rec."Qty. to Ship");
//             ResEntry.Validate("Shipment Date", Rec."Shipment Date");
//             ResEntry.Modify(true);
//         end else begin

//             EntryNo := ResEntry.GetLastEntryNo() + 1;

//             ResEntry.Init();
//             ResEntry."Entry No." := EntryNo;
//             ResEntry.Validate("Item No.", Rec."No.");
//             ResEntry.Validate("Location Code", Rec."Location Code");
//             ResEntry.Validate("Quantity (Base)", Rec."Qty. to Ship (Base)");
//             ResEntry.Validate("Quantity", Rec."Qty. to Ship");
//             ResEntry.Validate("Reservation Status", ResEntry."Reservation Status"::Surplus);
//             ResEntry.Validate("Description", Rec.Description);
//             ResEntry.Validate("Source Type", Database::"Sales Line");
//             ResEntry.Validate("Source Subtype", 1);
//             ResEntry.Validate("Source ID", Rec."Document No.");
//             ResEntry.Validate("Source Ref. No.", Rec."Line No.");
//             ResEntry.Validate("Shipment Date", Rec."Shipment Date");
//             ResEntry.Validate("Qty. per Unit of Measure", Rec."Qty. per Unit of Measure");
//             ResEntry.Validate("Qty. to Handle (Base)", Rec."Qty. to Ship (Base)");
//             ResEntry.Validate("Qty. to Invoice (Base)", Rec."Qty. Invoiced (Base)");
//             ResEntry.Validate("Variant Code", Rec."Variant Code");
//             ResEntry.Validate("Lot No.", ItemRec."Lot Nos.");
//             ResEntry.Validate("Created By", UserId);
//             ResEntry.Validate("Creation Date", Today);
//             ResEntry.Insert(true);
//         end;
//         Message(
//             'BR: %1', Rec."No.");
//     end;
// }