import UIKit

let n=5
for i in stride(from: n, to: 0, by: -1){
    for _ in 0...i-1{
        print("* ", terminator:"")
    }
    print()
}
