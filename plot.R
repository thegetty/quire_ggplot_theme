library(dplyr)
library(ggplot2)
library(scales)
library(ggrepel)

load("data/pi_data.rda")

# Most of the code below defines the aesthethic mapping of data to visual
# geometry. Items within the theme() declaration can be modified to adjust
# everything from background and header colors to spacing, margins, angles,
# justification, major & minor gridlines, etc.

# Area/line plots ----

ggplot(french_proportions, aes(x = lot_sale_year, y = value, fill = category)) +
  geom_area() +
  facet_wrap(~category, nrow = 1) +
  scale_y_continuous(limits = c(0, 1)) +
  labs(x = "Decade", y = "Precentage of lots offered for sale") +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1), 
    legend.position = "off"
  )

ggsave("out/area.svg", width = 9, height = 6)
ggsave("out/area.png", width = 9, height = 6)
ggsave("out/area.pdf", width = 9, height = 6)
  
ggplot(language_data, aes(x = starting_year, y = mean)) +
  geom_ribbon(aes(ymin = lower_bound, ymax = upper_bound), alpha = 0.5) +
  geom_line() +
  scale_y_continuous(limits = c(0,1), expand = c(0,0), labels = scales::percent) +
  scale_x_continuous(breaks = seq(1750, 1820, 10)) +
  facet_grid(project ~ varname) +
  labs(x = "", y = "", title = "") +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

ggsave("out/line.svg", width = 9, height = 6)
ggsave("out/line.png", width = 9, height = 6)
ggsave("out/line.pdf", width = 9, height = 6)

# Histograms ----

ggplot(sales_composition, aes(x = lot_sale_year, fill = nationality)) +
  geom_histogram(alpha = 0.5, binwidth = 2) +
  theme(
    legend.position = c(0.10, 0.90),
    legend.box.just = "left",
    legend.background = element_rect(fill = "transparent")
  )

ggsave("out/histogram.svg", width = 9, height = 6)
ggsave("out/histogram.png", width = 9, height = 6)
ggsave("out/histogram.pdf", width = 9, height = 6)

# Scatterplots ----

ggplot(french_upsampled_performance, aes(x = window_start, y = accuracy)) +
  geom_jitter(aes(color = varname), height = 0, alpha = 0.2) +
  geom_boxplot(alpha = 0) +
  facet_wrap(~varname, nrow = 1) +
  ylim(0.5, 0.9) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.position = "off"
  )

ggsave("out/boxplot_scatterplot.svg", width = 9, height = 6)
ggsave("out/boxplot_scatterplot.png", width = 9, height = 6)
ggsave("out/boxplot_scatterplot.pdf", width = 9, height = 6)

highlight_terms <- c("length", "sea", "man", "qrs", "whole", "head", "fowl", "ladi-", "queen", "gentleman", "dutchess", "live", "piec-", "profil-", "woman", "histori", "out", "battl", "collect", "larg", "flower", "holi", "famili", "small", "convers", "cattl", "our", "saviour", "landschap", "view", "fig", "companion", "it", "landscap")

ggplot(early_british_preponderances, aes(x = british, y = `not british`)) +
  geom_point(alpha = 0.3) +
  geom_label_repel(data = filter(early_british_preponderances, ngram %in% highlight_terms), aes(label = ngram, fill = difference >= 0)) +
  scale_x_sqrt() +
  scale_y_sqrt() +
  geom_abline(slope = 1, intercept = 0, color = "red") +
  labs(x = "Disporportionality \"British\"", y = "Disproportionately \"Not British\"") +
  theme(
    legend.position = "off"
  )

ggsave("out/annotated_scatterplot.svg", width = 9, height = 6)
ggsave("out/annotated_scatterplot.png", width = 9, height = 6)
ggsave("out/annotated_scatterplot.pdf", width = 9, height = 6)

# Stacked ribbons ----

ggplot(summarized_buyer_price_pdp, aes(x = deflated_expense_amount, fill = sale_buyer_type)) +
  geom_hline(aes(yintercept = 0.5), linetype = 3) +
  geom_hline(aes(yintercept = 0.5), linetype = 3) +
  geom_ribbon(aes_string(ymin = "ilow", ymax = "ihigh"), alpha = 0.7) +
  facet_wrap(~ model_period, nrow = 1) +
  scale_y_continuous(limits = c(0, 1)) +
  scale_x_log10(labels = dollar) +
  labs(x = "Purchase amount (in 1900 USD)") +
  # An example of defining color palettes for data
  scale_fill_manual(values = c("#617a89", "#0b53c1", "#ff0055", "#b3e93e")) +
  theme(
    legend.position = "top"
  )

ggsave("out/ribbonplot.svg", width = 9, height = 6)
ggsave("out/ribbonplot.png", width = 9, height = 6)
ggsave("out/ribbonplot.pdf", width = 9, height = 6)
