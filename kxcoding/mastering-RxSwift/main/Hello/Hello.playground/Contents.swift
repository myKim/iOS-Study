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

let disposeBag = DisposeBag()

//Observable.just("Hello, RxSwift")
//    .subscribe { print($0) }
//    .disposed(by: disposeBag)

// 명령형 프로그래밍
//var a = 1
//var b = 2
//a + b
//
//a = 12
//a + b // a의 값이 변경되면 다시 계산해주어야 한다.

// RxSwift로 구현한 반응형 프로그래밍
let a = BehaviorSubject(value: 1)
let b = BehaviorSubject(value: 2)

Observable.combineLatest(a, b) { $0 + $1 }
    .subscribe({ print($0) })
    .disposed(by: disposeBag)

a.onNext(12) // 값 변경 -> next(14) 출력




















