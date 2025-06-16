// pageextension 71103 BudgetPageExt extends "Budget" // Assuming the original page name is "Budget"
// {
//     // Add your customizations here
//     layout
//     {
//         // Modify or add controls to the layout

//         addafter(MatrixForm)
//         {
//             part("Posted Budget Lines"; "MASQ Budget Matrix")
//             {
//                 ApplicationArea = All;
//                 Caption = 'Posted Budget Lines';
//                 // SubPageLink = "Budget Name" = filter(BudgetName);
//                 //  SubPageLink = "Budget Name" = getbudgetname;
//             }
//         }
//     }

//     actions
//     {
//         // Add or modify actions here
//     }


//     trigger OnOpenPage()
//     var
//         BudgetNameRec: Record "G/L Budget Name";
//     begin
//         // Code to execute when the page is opened
//         // For example, you can set default values or initialize variables
//         Clear(BudgetNameRec);
//         BudgetNameRec.Get(BudgetName);
//         GLAccCategoryFilter := BudgetNameRec.GLAccCategoryFilter;
//         SetGLAccountCategoryFilter(BudgetNameRec.GLAccCategoryFilter);
//         IncomeBalanceGLAccFilter := BudgetNameRec.IncomeBalanceGLAccFilter;
//         SetIncomeBalanceGLAccFilter(BudgetNameRec.IncomeBalanceGLAccFilter);
//         BusUnitFilter := BudgetNameRec.busUnitFilter;
//         DateFilter := BudgetNameRec.DateFilter;
//         ValidateDateFilter(DateFilter);
//         GLAccFilter := BudgetNameRec.GLAccFilter;
//         SetGLAccountFilter(BudgetNameRec.GLAccFilter);
//         SetBudgetDimFilters(BudgetNameRec.GlobalDim1Filter, BudgetNameRec.GlobalDim2Filter, BudgetNameRec.BudgetDim1Filter, BudgetNameRec.BudgetDim2Filter, BudgetNameRec.BudgetDim3Filter, BudgetNameRec.BudgetDim4Filter);
//     end;

// }