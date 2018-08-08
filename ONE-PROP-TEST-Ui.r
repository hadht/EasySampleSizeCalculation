# This file is part of Easy Sample Size Calculation Project.
# 
# Copyright (c) 2018, T. R. Santos and L. Lima, 
# All rights reserved.
#
# Easy Sample Size Calculation is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
#  Easy Sample Size Calculation is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Lesser General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with Sample Size Calculator.If not, see <http://www.gnu.org/licenses/>.
# If you use this software, you necessarily agree with all its terms.

library(shiny)
shinyUI(pageWithSidebar(
headerPanel("Hypothesis Test for One Proportion"),
sidebarPanel(
numericInput(inputId = "p0",
label = "proportion (alternative hypothesis)",
value = 0.5,
min = 0,
max = 1,
step = 0.01
),
numericInput(inputId = "p1",
label = "proportion (alternative hypothesis)",
value = 0.6,
min = 0,
max = 1,
step = 0.01
),
numericInput(inputId = "sig.level",
label = "alfa",
value = 0.05,
min = 0,
max = 1,
step = 0.01
),
numericInput(inputId = "power",
label = "power",
value = 0.8,
min = 0,
max = 1,
step = 0.01
),
checkboxInput("two.sided", "two sided test", FALSE)
),
mainPanel(
h3("The Sample Size"),
textOutput("Answer")
)
))

