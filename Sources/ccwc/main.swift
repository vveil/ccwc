import Foundation

let arguments = CommandLine.arguments

if arguments.count > 1 {
  let parameter = arguments[1]
  print("Parameter provided: \(parameter)")
  // Implement your tool's logic here
} else {
  print("No parameter provided.")
}
