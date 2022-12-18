import Foundation

public struct Queue<T> {
  fileprivate var array = [T]()
  
  public var isEmpty: Bool {
    return array.isEmpty
  }
  
  public var count: Int {
    return array.count
  }
  
  public mutating func enquque(_ element: T) {
    array.append(element)
  }
  
  public mutating func dequeue() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.removeFirst()
    }
  }
  
  public var front: T? {
    return array.first
  }
}

struct DoublePriorityQueue {
  private var _elements = [Int]()

  mutating func insert(_ number: Int) {
    _elements.append(number)
  }

  mutating func deleteMaximum() {
    guard !_elements.isEmpty else { return }
    let max = _elements.max()!
    let index = _elements.firstIndex { $0 == max }
    _elements.remove(at: index!)
  }

  mutating func deleteMinimum() {
    guard !_elements.isEmpty else { return }
    let min = _elements.min()!
    let index = _elements.firstIndex { $0 == min }
    _elements.remove(at: index!)
  }

  var elements: [Int] {
    if _elements.isEmpty {
      return [0, 0]
    } else {
      let maximum = _elements.max()!
      let minimum = _elements.min()!
      return [maximum, minimum]
    }
  }
}
