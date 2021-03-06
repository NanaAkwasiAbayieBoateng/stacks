context("helpers")

load(test_path("helper_data.Rda"))

test_that("object types relate as expected", {
  atts_d <- attributes(st_reg_1)
  
  expect_true(check_inherits(st_reg_1, "data_stack"))
  expect_true(check_inherits(st_reg_1_, "model_stack"))
  
  expect_equal(atts_d$outcome, st_reg_1_[["outcome"]])
  expect_equal(atts_d$mode, st_reg_1_[["mode"]])
  expect_equal(atts_d$model_defs, st_reg_1_[["model_defs"]])
  expect_equal(atts_d$cols_map, st_reg_1_[["cols_map"]])
  expect_equal(atts_d$model_metrics, st_reg_1_[["model_metrics"]])
  expect_equal(atts_d$train, st_reg_1_[["train"]])
  
  expect_equal(tibble::as_tibble(st_reg_1), st_reg_1_[["data_stack"]])
})

test_that("control_* functions work", {
  ctrl_grid <- control_stack_grid()
  ctrl_bayes <- control_stack_bayes()
  ctrl_res <- control_stack_resamples()
  
  expect_true(ctrl_grid$save_pred)
  expect_true(ctrl_bayes$save_pred)
  expect_true(ctrl_res$save_pred)
  
  expect_true(ctrl_grid$save_workflow)
  expect_true(ctrl_bayes$save_workflow)
  expect_true(ctrl_res$save_workflow)
  
  expect_true(check_inherits(ctrl_grid, "control_grid"))
  expect_true(check_inherits(ctrl_bayes, "control_bayes"))
  expect_true(check_inherits(ctrl_res, "control_resamples"))
})

test_that("misc. utilities work", {
  expect_error(check_inherits("howdy", "numeric"), "`howdy` needs to inherit")
  expect_true(check_inherits("howdy", "character"))
  
  yall <- "y'all"
  expect_error(glue_stop("howdy {yall}"), "howdy y'all")
  expect_warning(glue_warn("howdy {yall}"), "howdy y'all")
  expect_message(glue_message("howdy {yall}"), "howdy y'all")
})









