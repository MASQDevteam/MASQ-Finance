permissionset 71100 GeneratedPermFinance
{
    Assignable = true;
    Permissions = tabledata "Budget Entry" = RIMD,
        tabledata "Budget Import Buffer" = RIMD,
        tabledata "MASQ Budget" = RIMD,
        table "Budget Entry" = X,
        table "Budget Import Buffer" = X,
        table "MASQ Budget" = X,
        codeunit "Budget Control" = X,
        codeunit "MASQ Finance Subs" = X,
        page "Budget Card1" = X,
        page "Budget List1" = X,
        page "MASQ Budget Matrix" = X,
        page "project invoice" = X;
}