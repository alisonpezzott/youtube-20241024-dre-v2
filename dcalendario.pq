let
    dataInicial = #date(2021, 1, 1),
    dataFinal = #date(2024, 12, 31),
    dias = List.Dates(
        dataInicial, 
        Duration.Days(dataFinal - dataInicial) + 1, 
        #duration(1, 0, 0, 0)
    ),
    tabela = #table(
        type table[
            Data = date,
            Ano = Int64.Type,
            Mes = text,
            MesInicio = date
        ], 
        List.Transform(
            dias, 
            each {
                _,
                Date.Year(_),
                Text.Proper(Date.ToText(_, "MMM-yy")),
                Date.StartOfMonth(_)
            }
        )      
    )
in
    tabela
    