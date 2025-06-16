// page 71101 "G/L Budget Card"
// {
//     AdditionalSearchTerms = 'general ledger budgets,general ledger forecast';
//     ApplicationArea = Suite;
//     Caption = 'G/L Budget Card';
//     PageType = Card;
//     SourceTable = "G/L Budget Name";
//     UsageCategory = Documents;

//     layout
//     {
//         area(content)
//         {
//             group(General)
//             {



//                 ShowCaption = false;
//                 field(Name; Rec.Name)
//                 {
//                     ApplicationArea = Suite;
//                     ToolTip = 'Specifies the name of the general ledger budget.';
//                 }
//                 field(Description; Rec.Description)
//                 {
//                     ApplicationArea = Suite;
//                     ToolTip = 'Specifies a description of the general ledger budget name.';
//                 }
//                 field("Global Dimension 1 Code"; GLSetup."Global Dimension 1 Code")
//                 {
//                     ApplicationArea = Dimensions;
//                     Caption = 'Global Dimension 1 Code';
//                     Editable = false;
//                     ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
//                 }
//                 field("Global Dimension 2 Code"; GLSetup."Global Dimension 2 Code")
//                 {
//                     ApplicationArea = Dimensions;
//                     Caption = 'Global Dimension 2 Code';
//                     Editable = false;
//                     ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
//                 }
//                 field("Budget Dimension 1 Code"; Rec."Budget Dimension 1 Code")
//                 {
//                     ApplicationArea = Dimensions;
//                     ToolTip = 'Specifies a code for a budget dimension. You can specify four additional dimensions on each budget that you create.';
//                 }
//                 field("Budget Dimension 2 Code"; Rec."Budget Dimension 2 Code")
//                 {
//                     ApplicationArea = Dimensions;
//                     ToolTip = 'Specifies a code for a budget dimension. You can specify four additional dimensions on each budget that you create.';
//                 }
//                 field("Budget Dimension 3 Code"; Rec."Budget Dimension 3 Code")
//                 {
//                     ApplicationArea = Dimensions;
//                     ToolTip = 'Specifies a code for a budget dimension. You can specify four additional dimensions on each budget that you create.';
//                 }
//                 field("Budget Dimension 4 Code"; Rec."Budget Dimension 4 Code")
//                 {
//                     ApplicationArea = Dimensions;
//                     ToolTip = 'Specifies a code for a budget dimension. You can specify four additional dimensions on each budget that you create.';
//                 }
//                 field(Blocked; Rec.Blocked)
//                 {
//                     ApplicationArea = Suite;
//                     ToolTip = 'Specifies that the related record is blocked from being posted in transactions, for example a customer that is declared insolvent or an item that is placed in quarantine.';
//                 }
//                 field("Starting Date"; Rec."Starting Date")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Starting Date field.', Comment = '%';

//                     trigger OnValidate()
//                     var
//                     begin

//                         IF (Rec."Starting Date" <> 0D) and (Rec."Ending Date" <> 0D) then begin

//                             Rec.DateFilter := Format(Rec."Starting Date") + '..' + Format(Rec."Ending Date");
//                         end else begin
//                             Rec.DateFilter := '';
//                         end;
//                     end;

//                 }
//                 field("Ending Date"; Rec."Ending Date")
//                 {
//                     ApplicationArea = All;
//                     ToolTip = 'Specifies the value of the Ending Date field.', Comment = '%';

//                     trigger OnValidate()
//                     var
//                     begin

//                         IF (Rec."Starting Date" <> 0D) and (Rec."Ending Date" <> 0D) then begin

//                             Rec.DateFilter := Format(Rec."Starting Date") + '..' + Format(Rec."Ending Date");
//                         end else begin
//                             Rec.DateFilter := '';
//                         end;
//                     end;
//                 }
//             }

//             group(Filters)
//             {
//                 Caption = 'Filters';
//                 field(DateFilter; Rec.DateFilter)
//                 {
//                     ApplicationArea = Suite;
//                     Caption = 'Date Filter';
//                     ToolTip = 'Specifies the dates that will be used to filter the amounts in the window.';
//                     Importance = Promoted;

//                 }
//                 field(GLAccFilter; Rec.GLAccFilter)
//                 {
//                     ApplicationArea = Suite;
//                     Caption = 'G/L Account Filter';
//                     ToolTip = 'Specifies the G/L accounts for which you will see information in the window.';
//                     Importance = Promoted;

//                     trigger OnLookup(var Text: Text): Boolean
//                     var
//                         GLAccList: Page "G/L Account List";
//                     begin
//                         GLAccList.LookupMode(true);
//                         if not (GLAccList.RunModal() = ACTION::LookupOK) then
//                             exit(false);

//                         Text := GLAccList.GetSelectionFilter();
//                         exit(true);
//                     end;


//                 }
//                 field(GLAccCategory; Rec.GLAccCategoryFilter)
//                 {
//                     ApplicationArea = Suite;
//                     Caption = 'G/L Account Category Filter';
//                     ToolTip = 'Specifies the category of the G/L account for which you will see information in the window.';
//                     Importance = Promoted;


//                 }
//                 field(IncomeBalGLAccFilter; Rec.IncomeBalanceGLAccFilter)
//                 {
//                     ApplicationArea = Suite;
//                     Caption = 'Income/Balance G/L Account Filter';
//                     ToolTip = 'Specifies the type of the G/L account for which you will see information in the window.';
//                     Importance = Promoted;

//                 }
//                 field(GlobalDim1Filter; Rec.GlobalDim1Filter)
//                 {
//                     ApplicationArea = Dimensions;
//                     CaptionClass = '1,3,1';
//                     Caption = 'Global Dimension 1 Filter';

//                     ToolTip = 'Specifies by which global dimension data is shown. Global dimensions are the dimensions that you analyze most frequently. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
//                     Importance = Promoted;

//                     trigger OnLookup(var Text: Text): Boolean
//                     var
//                         DimensionValue: Record "Dimension Value";
//                     begin
//                         exit(DimensionValue.LookUpDimFilter(GLSetup."Global Dimension 1 Code", Text));
//                     end;


//                 }
//                 field(GlobalDim2Filter; Rec.GlobalDim2Filter)
//                 {
//                     ApplicationArea = Dimensions;
//                     CaptionClass = '1,3,2';
//                     Caption = 'Global Dimension 2 Filter';

//                     ToolTip = 'Specifies by which global dimension data is shown. Global dimensions are the dimensions that you analyze most frequently. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
//                     Importance = Promoted;

//                     trigger OnLookup(var Text: Text): Boolean
//                     var
//                         DimensionValue: Record "Dimension Value";
//                     begin
//                         exit(DimensionValue.LookUpDimFilter(GLSetup."Global Dimension 2 Code", Text));
//                     end;

//                 }
//                 field(BudgetDim1Filter; Rec.BudgetDim1Filter)
//                 {
//                     ApplicationArea = Dimensions;
//                     //   CaptionClass = GetCaptionClass(1);
//                     Caption = 'Budget Dimension 1 Filter';

//                     ToolTip = 'Specifies a filter by a budget dimension. You can specify four additional dimensions on each budget that you create.';
//                     Importance = Promoted;

//                     trigger OnLookup(var Text: Text): Boolean
//                     var
//                         DimensionValue: Record "Dimension Value";
//                     begin
//                         exit(DimensionValue.LookUpDimFilter(Rec."Budget Dimension 1 Code", Text));
//                     end;

//                 }
//                 field(BudgetDim2Filter; Rec.BudgetDim2Filter)
//                 {
//                     ApplicationArea = Dimensions;
//                     // CaptionClass = GetCaptionClass(2);
//                     Caption = 'Budget Dimension 2 Filter';

//                     ToolTip = 'Specifies a filter by a budget dimension. You can specify four additional dimensions on each budget that you create.';
//                     Importance = Promoted;

//                     trigger OnLookup(var Text: Text): Boolean
//                     var
//                         DimensionValue: Record "Dimension Value";
//                     begin
//                         exit(DimensionValue.LookUpDimFilter(Rec."Budget Dimension 2 Code", Text));
//                     end;


//                 }
//                 field(BudgetDim3Filter; Rec.BudgetDim3Filter)
//                 {
//                     ApplicationArea = Dimensions;
//                     // CaptionClass = GetCaptionClass(3);
//                     Caption = 'Budget Dimension 3 Filter';

//                     ToolTip = 'Specifies a filter by a budget dimension. You can specify four additional dimensions on each budget that you create.';
//                     Importance = Promoted;

//                     trigger OnLookup(var Text: Text): Boolean
//                     var
//                         DimensionValue: Record "Dimension Value";
//                     begin
//                         exit(DimensionValue.LookUpDimFilter(Rec."Budget Dimension 3 Code", Text));
//                     end;


//                 }
//                 field(BudgetDim4Filter; Rec.BudgetDim4Filter)
//                 {
//                     ApplicationArea = Dimensions;
//                     // CaptionClass = GetCaptionClass(4);
//                     Caption = 'Budget Dimension 4 Filter';

//                     ToolTip = 'Specifies a filter by a budget dimension. You can specify four additional dimensions on each budget that you create.';
//                     Importance = Promoted;

//                     trigger OnLookup(var Text: Text): Boolean
//                     var
//                         DimensionValue: Record "Dimension Value";
//                     begin
//                         exit(DimensionValue.LookUpDimFilter(Rec."Budget Dimension 4 Code", Text));
//                     end;


//                 }
//             }
//         }
//         area(factboxes)
//         {
//             systempart(Control1900383207; Links)
//             {
//                 ApplicationArea = RecordLinks;
//                 Visible = false;
//             }
//             systempart(Control1905767507; Notes)
//             {
//                 ApplicationArea = Notes;
//                 Visible = false;
//             }
//         }
//     }

//     actions
//     {
//         area(processing)
//         {
//         }
//     }

//     trigger OnOpenPage()
//     begin
//         GLSetup.Get();
//     end;

//     var
//         GLSetup: Record "General Ledger Setup";

//     procedure GetSelectionFilter(): Text
//     var
//         GLBudgetName: Record "G/L Budget Name";
//         SelectionFilterManagement: Codeunit SelectionFilterManagement;
//     begin
//         CurrPage.SetSelectionFilter(GLBudgetName);
//         exit(SelectionFilterManagement.GetSelectionFilterForGLBudgetName(GLBudgetName));
//     end;

//     var
// }

