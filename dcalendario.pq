let
    dataInicial = #date(2021, 1, 1),
    dataFinal = #date(2024, 12, 31),
    dias = List.Dates(
        dataInicial, 
        Number.From(dataFinal - dataInicial) + 1, 
        #duration(1, 0, 0, 0)
    ),
    tabela = #table(
        type table[
            Data = date,
            Mes = number,
            MesNome = text,
            MesNomeAbreviado = text,
            Ano = number,
            MesAnoNome = text,
            MesInicio = number
        ], 
        List.Transform(
            dias, 
            each {
                _,
                Date.Month(_),
                Date.MonthName(_, "pt-BR"),
                Text.Start(Date.MonthName(_, "pt-BR"), 3),
                Date.Year(_),
                Date.ToText(_, "MMM-yy"),
                Date.StartOfMonth(_)
            }
        )      
    )
in
    tabela


