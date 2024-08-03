
# Pacotes
library(GetBCBData)
library(ggplot2)

#Coletando dados SELIC no SGS/BDB

dados_sgs = gbcbd_get_series(id = 432,
                             first.date = "2000-01-01",
                             last.date = Sys.Date())

## Gráfico

ggplot(dados_sgs, aes(x = ref.date))+
      geom_line(aes(y = value), color = "orange", size = 1.5) +
      geom_label(data = subset(dados_sgs, format(ref.date, "%m-%d") == "08-02"),
                                aes(label = sprintf("%.2f%%", value),y = value),
                                size = 3.4) +
      labs(title = "Taxa de Juros",
                    x = "",
                    y = "(%)") +
      theme_minimal() +
      theme(legend.position = "none")
