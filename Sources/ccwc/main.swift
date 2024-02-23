import Foundation

func getParamAfterFlag(flag: String, parameters: [String]) -> String? {
  if let index = parameters.firstIndex(of: flag) {
    let indexAfterFlag = index + 1
    if indexAfterFlag
      < parameters.endIndex
    {
      return parameters[indexAfterFlag]
    }
  }
  return nil
}

let arguments = CommandLine.arguments

if arguments.count > 1 {
  let parameters = Array(arguments[1...])

  if let paramAfterCFlag = getParamAfterFlag(flag: "-c", parameters: parameters) {
    print("Parameter after -c flag: \(paramAfterCFlag)")
    
  } else {
    print("No parameter after -c flag.")
  }

  print("Parameter provided: \(parameters)")

} else {
  print("No parameter provided.")
}
