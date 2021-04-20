//
//  Copyright (c) 2019 KxCoding <kky0317@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit
import RxSwift
import RxCocoa // Subject와 다르게 import

/*:
 # Relay
 */

let bag = DisposeBag()

let publishRelay = PublishRelay<Int>()
publishRelay.subscribe { print("1: \($0)") }
    .disposed(by: bag)

// relay는 onNext 메서드를 제공하지 않는다. 대신 accept 메서드를 사용한다.
publishRelay.accept(1)
publishRelay.accept(2)



let behaviorRelay = BehaviorRelay<Int>(value: 1)
behaviorRelay.accept(2)

behaviorRelay.subscribe { print("2: \($0)") }
    .disposed(by: bag)

behaviorRelay.accept(3)
print(behaviorRelay.value) // readonly 속성, 값을 바꾸고 싶다면 accept를 통해 새로운 값을 전달해야 한다.
