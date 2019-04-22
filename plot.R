library(dplyr)
library(ggplot2)
library(ggrepel)
library(ggedit)

load("data/pi_data.rda")

bootstrapped_plot <- function() {
  list(
    scale_x_continuous(breaks = seq(1750, 1820, 10)),
    facet_grid(project ~ varname),
    labs(x = "", y = "", title = ""),
    theme_light(),
    theme(panel.spacing = unit(2, "lines"), axis.text.x = element_text(angle = 45, hjust = 1, vjust = 0.5))
  )
}

pres_theme <- function(...) {
  list(
    theme_minimal(),
    theme(...)
  )
}

proportion_plot <- function() {
  list(
    facet_wrap(~category, nrow = 1),
    scale_y_continuous(name = "Precentage of lots offered for sale", limits = c(0, 1)),
    pres_theme(legend.position = "none"),
    xlab("Decade"),
    tilt_x_axis(),
    geom_hline(yintercept = 50)
  )
}

accuracy_plot <- function() {
  list(
    facet_wrap(~varname, nrow = 1),
    scale_y_continuous(name = "Correct predictions per 100 guesses", limits = c(50, 90)),
    pres_theme(legend.position = "none"),
    xlab("Decade"),
    tilt_x_axis(),
    geom_hline(yintercept = 50)
  )
}

term_preponderance_chart <- function(df, terms) {
  df %>% 
    ggplot(aes_(x = as.name(names(df)[2]), y = as.name(names(df)[3]))) +
    geom_point(alpha = 0.3) +
    geom_label_repel(data = filter(df, ngram %in% terms), aes(label = ngram, fill = difference >= 0)) +
    scale_fill_discrete(guide = FALSE) +
    scale_x_sqrt() +
    scale_y_sqrt() +
    geom_abline(slope = 1, intercept = 0, color = "red") +
    pres_theme()
}

# Area/line plots

area_theme <- ggedit(ggplot(french_proportions, aes(x = lot_sale_year, y = value, fill = category)) +
  geom_area() +
  facet_wrap(~category, nrow = 1) +
  scale_y_continuous(name = "Precentage of lots offered for sale", limits = c(0, 1)) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position = "off") +
  xlab("Decade"))

ggedit(ggplot(language_data, aes(x = starting_year, y = mean)) +
  geom_line() +
  geom_ribbon(aes(ymin = lower_bound, ymax = upper_bound), alpha = 0.5) +
  scale_y_continuous(limits = c(0,1), expand = c(0,0), labels = scales::percent) +
  scale_x_continuous(breaks = seq(1750, 1820, 10)) +
  facet_grid(project ~ varname) +
  labs(x = "", y = "", title = "") +
  theme_minimal() +
  theme(panel.spacing = unit(2, "lines"), axis.text.x = element_text(angle = 45, hjust = 1, vjust = 0.5)))
