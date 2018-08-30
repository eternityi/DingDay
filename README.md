# DingDay

## Architecture

The project is an example to show how to use MVP in action.

The Model-View-Controller(MVC) is a common design pattern.

The Model-View-Presenter(MVP) pattern has many variations with small differences between them. I chose the common one that seems to be mostly used in the modern day's app development.

 * View part consists of both UIViews & UIViewControllers
 * View delegates user interactions to the presenter
 * Presenter contains the logic to handel user interactions
 * Presenter has no dependencies to UIKit