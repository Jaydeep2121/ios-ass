import UIKit

var n=5,k=n-1,m=0,j=0
for i in 0...n-1{
    for j in 0...n-1{
        if(k<=j && m<=i){
            print("* ", terminator:"")
        }else{
            print("  ", terminator:"")
        }
    }
    m+=1
    k-=1
    print()
}
