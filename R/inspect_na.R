#' Summarize missingness in data frame columns
#'
#' @description
#' `inspect_na()` summarizes the rate of missingness in each column of a data
#' frame. For a grouped data frame, the rate of missingness is summarized
#' separately for each group.
#'
#' @details
#' The tibble returned contains the columns:
#' - **col_name**: column names of `df`.
#' - **cnt**: number of `NA` values per column.
#' - **pcnt**: percentage of records that are `NA`.
#'
#' For grouped data frames the group key columns appear first, followed by
#' `col_name`, `cnt`, and `pcnt`. Rows are sorted by group keys (ascending)
#' then by `cnt` (descending) within each group.
#'
#' @param df A data frame or grouped data frame.
#'
#' @return A tibble.
#' @export
#'
#' @examples
#' inspect_na(airquality)
#' # Grouped dataframe summary
#' airquality |>
#'   dplyr::group_by(Month) |>
#'   inspect_na()
#'
inspect_na <- function(df) {
  if (!inherits(df, "data.frame")) {
    stop("`df` must be a data frame.", call. = FALSE)
  }

  if (dplyr::is_grouped_df(df)) {
    .inspect_na_grouped(df)
  } else {
    .inspect_na_ungrouped(df)
  }
}

# ── helpers (not exported) ────────────────────────────────────────────────────

#' @keywords internal
.na_counts <- function(df, cols = names(df)) {
  # colSums(is.na()) is a single vectorised C call — faster than vapply on
  # wide frames, and returns a named integer vector directly.
  as.integer(colSums(is.na(df[cols])))
}

#' @keywords internal
.inspect_na_ungrouped <- function(df) {
  n <- nrow(df)
  cnt <- .na_counts(df)

  out <- tibble::tibble(
    col_name = names(df),
    cnt      = cnt,
    pcnt     = if (n > 0L) cnt / n * 100 else rep(NA_real_, length(cnt))
  )
  out[order(-out$cnt), ]
}

#' @keywords internal
.inspect_na_grouped <- function(df) {
  group_vars <- dplyr::group_vars(df)
  data_cols <- setdiff(names(df), group_vars)

  if (length(data_cols) == 0L) {
    stop("`df` must contain at least one non-grouping column.", call. = FALSE)
  }

  # reframe() is the correct verb here: it returns *multiple rows* per group
  # (one per column), which summarise() does not support in dplyr >= 1.1.
  # The single pass avoids the summarise() + pivot_longer() two-step.
  out <- dplyr::reframe(
    df,
    col_name = data_cols,
    cnt      = .na_counts(dplyr::pick(dplyr::all_of(data_cols)), data_cols),
    n_rows   = dplyr::n()
  )

  out$pcnt <- ifelse(out$n_rows > 0L, out$cnt / out$n_rows * 100, NA_real_)
  out$n_rows <- NULL

  ord <- do.call(order, c(lapply(group_vars, function(v) out[[v]]), list(-out$cnt)))

  tibble::as_tibble(out[ord, c(group_vars, "col_name", "cnt", "pcnt")])
}
