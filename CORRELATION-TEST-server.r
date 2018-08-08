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
z.a <- qnorm(1 - input$sig.level / 2)
if (!input$two.sided) {
z.a <- qnorm(1 - input$sig.level)
}
z.b <- qnorm(input$power)
z.r <- log((1 + input$r) / (1 - input$r)) / 2
res <- ceiling(((z.b + z.a) / z.r) ^ 2 + 3)
paste0("The Sample size is", res, "pairs of observations."
)
})
})
