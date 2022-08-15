//: [Previous](@previous)

import Foundation

/// Operation 是基於 GCD 的一層封裝
/// 比 GCD 好用的地方是可以設定 dependency, pause, resume, cancel
/// OperationQueue 是用來存放一個個 Operation 的 Queue
/// OperationQueue 內的 opertation 都是並發想要依順序執行則是透過 dependency 來達到, 也可以設定 OperationQueue maxConcurrentOperationCount = 1
/// Opertation 可視為一個任務，可以透過繼承後來初始化，或是透過 BlockOperation 來建立

let thread = Thread.current
print("thread:\(thread)")

let queue = OperationQueue.main
//queue.maxConcurrentOperationCount = 1
let operation = BlockOperation {
    print("task1:\(Thread.current)")
    sleep(1)
    print("task1 end:\(Thread.current)")
}

let operation2 = BlockOperation {
    print("task2:\(Thread.current)")
    sleep(1)
    print("task2 end:\(Thread.current)")
}
operation2.addDependency(operation)
queue.addOperation(operation)
queue.addOperation(operation2)

queue.addOperation {
    print("task3:\(Thread.current)")
    sleep(1)
    print("task3 end:\(Thread.current)")
}

//: [Next](@next)
