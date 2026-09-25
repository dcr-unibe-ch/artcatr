# Test pinning artcatr() against the 8 worked examples published in
# White et al (2023) "artcat: Sample-size calculation for an ordered
# categorical outcome" (Stata Journal 23(1):3-23), as reproduced in the
# package's own example log:
# https://raw.githubusercontent.com/UCL/artcat/main/package/artcat_examples.log
#
# Each test reproduces one `artcat` Stata call and checks the
# "Total sample size (calculated)" / "Power (calculated)" and per-group sizes

test_that("six-level outcome, ologit(NA) [default method] matches Stata (n=322)", {
  # artcat, pc(.018 .036 .156 .141 .39) or(1/1.77) power(.8) unfavourable
  r <- artcatr(pc = c(.018, .036, .156, .141, .39, .259), or = 1 / 1.77, power = .8,
              favourable = FALSE, quiet = TRUE)
  expect_equal(r$n, 322)
  expect_equal(r$nC, 161)
  expect_equal(r$nE, 161)
})

test_that("six-level outcome, power given n=322 matches Stata power=0.801", {
  # artcat, pc(.018 .036 .156 .141 .39) or(1/1.77) n(322) unfavourable
  r <- artcatr(pc = c(.018, .036, .156, .141, .39, .259), or = 1 / 1.77, n = 322,
              favourable = FALSE, quiet = TRUE)
  expect_equal(round(r$power, 3), 0.801)
})

test_that("six-level outcome, Whitehead method matches Stata (n=320)", {
  # artcat, pc(.018 .036 .156 .141 .39) or(1/1.77) whitehead unfavourable
  r <- artcatr(pc = c(.018, .036, .156, .141, .39, .259), or = 1 / 1.77, power = .8,
              favourable = FALSE, method = "whitehead", quiet = TRUE)
  expect_equal(r$n, 320)
  expect_equal(r$nC, 160)
  expect_equal(r$nE, 160)
})

test_that("non-inferiority trial (margin=1.33) matches Stata (n=1314)", {
  # artcat, pc(.010 .021 .099 .103 .384) or(1) margin(1.33) unfavourable
  r <- artcatr(pc = c(.010, .021, .099, .103, .384, .383), or = 1, margin = 1.33,
              power = .8, favourable = FALSE, quiet = TRUE)
  expect_equal(r$n, 1314)
  expect_equal(r$nC, 657)
  expect_equal(r$nE, 657)
})

test_that("binary outcome matches Stata (n=216)", {
  # artcat, pc(.4) pe(.2) power(.9) unfavourable
  r <- artcatr(pc = c(.4, .6), pe = c(.2, .8), power = .9, favourable = FALSE,
              quiet = TRUE)
  expect_equal(r$n, 216)
  expect_equal(r$nC, 108)
  expect_equal(r$nE, 108)
})

test_that("cumulative 3-level outcome matches Stata (n=216)", {
  # artcat, pc(.01 .4) cum or(.375) power(.9) unfavourable
  r <- artcatr(pc = c(.01, .4, 1), cumulative = TRUE, or = .375, power = .9,
              favourable = FALSE, quiet = TRUE)
  expect_equal(r$n, 216)
  expect_equal(r$nC, 108)
  expect_equal(r$nE, 108)
})

test_that("cumulative 4-level outcome matches Stata (n=212)", {
  # artcat, pc(.01 .1 .4) cum or(.375) power(.9) unfavourable
  r <- artcatr(pc = c(.01, .1, .4, 1), cumulative = TRUE, or = .375, power = .9,
              favourable = FALSE, quiet = TRUE)
  expect_equal(r$n, 212)
  expect_equal(r$nC, 106)
  expect_equal(r$nE, 106)
})

test_that("cumulative 3-level outcome (different split) matches Stata (n=154)", {
  # artcat, pc(.4 .7) cum or(.375) power(.9) unfavourable
  r <- artcatr(pc = c(.4, .7, 1), cumulative = TRUE, or = .375, power = .9,
              favourable = FALSE, quiet = TRUE)
  expect_equal(r$n, 154)
  expect_equal(r$nC, 77)
  expect_equal(r$nE, 77)
})
