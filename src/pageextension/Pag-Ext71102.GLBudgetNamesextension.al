// pageextension 71102 "G/L Budget Names extension" extends "G/L Budget Names"
// {

//     layout
//     {
//         // Add changes to page layout here
//         addafter(Blocked)
//         {
//             field("Starting Date"; Rec."Starting Date")
//             {
//                 ApplicationArea = All;
//                 ToolTip = 'Specifies the value of the Starting Date field.', Comment = '%';
//             }
//             field("Ending Date"; Rec."Ending Date")
//             {
//                 ApplicationArea = All;
//                 ToolTip = 'Specifies the value of the Ending Date field.', Comment = '%';
//             }
//         }
//     }

//     actions
//     {
//         // Add changes to page actions here
//         addafter(EditBudget)
//         {
//             action(EditBudgetCard)
//             {
//                 ApplicationArea = All;
//                 //   Caption = 'Show Budget Lines';
//                 Image = ChartOfAccounts;
//                 trigger OnAction()
//                 var
//                     BudgetCard: Page "G/L Budget Card";
//                 begin
//                     BudgetCard.SetRecord(Rec);
//                     BudgetCard.RunModal;
//                 end;
//             }
//         }

//     }


//     var
//         myInt: Integer;
// }