import Foundation

func fileSizeInBytes(forPath path: String) -> UInt64? {
  let fileManager = FileManager.default

  do {
    let attributes = try fileManager.attributesOfItem(atPath: path)
    if let fileSize = attributes[.size] as? UInt64 {
      return fileSize
    } else {
      print("Could not retrieve file size.")
      return nil
    }
  } catch {
    print("Error: \(error)")
    return nil
  }
}

var arguments = CommandLine.arguments
var output = ""

var content = ""
var path = ""
if arguments.count == 1 {
  while let line = readLine() {
    content.append(line)
  }
  if content.isEmpty {
    print("No input provided.")
    exit(1)
  }
} else {
  if let filePath = Array(arguments[1...]).filter({ !$0.hasPrefix("-") }).first {
    path = filePath
    if let fileContent = try? String(contentsOfFile: path) {
      content = fileContent
    } else {
      exit(1)
    }
  } else {
    exit(1)
  }
}

if arguments.count == 2 {
  // add arguments for default call
  arguments += ["-l", "-w", "-c"]
}

if arguments.count > 2 {
  let parameters = Array(arguments[1...])

  if parameters.contains("-l") {
    output.append(String(content.components(separatedBy: "\n").count))
  }

  if parameters.contains("-w") {
    let words = content.split { $0.isWhitespace }
    output.append("  \(words.count)")
  }

  if parameters.contains("-m") {
    output.append("  \(String(content.count))")
  }

  if parameters.contains("-c") {
    if let size = fileSizeInBytes(forPath: path) {
      output.append("  \(String(size))")
    }

  }
  output.append("  \(path)")
}
print(output)
