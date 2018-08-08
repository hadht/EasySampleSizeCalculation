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
shinyServer(function(input, output) {
output$resposta <- renderText({   
if (input$sd.known) {
z.a <- qnorm(1 - input$sig.level)
if (input$two.sided) {
z.a <- qnorm(1 - input$sig.level / 2)
}
z.b <- qnorm(input$power)
res <- ceiling(((z.a + z.b) * input$sd / input$d) ^ 2)
}
else {
if (!input$two.sided) f <- function(x) ((qt(1 - input$sig.level, x - 1) + qt(input$power, x - 1)) * input$sd / input$d) ^ 2 - x else f <- function(x) ((qt(1 - input$sig.level / 2, x - 1) + qt(input$power, x - 1)) * input$sd / input$d) ^ 2 - x
res <- ceiling(uniroot(f, c(2,1e+07), tol = .Machine$double.eps ^ 0.25)$root)
}        
paste0("The Sample size is", res, " individuals."
)
})
})

