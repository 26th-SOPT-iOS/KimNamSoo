# KimNamSoo
김남수



## 목차

| 제목 | 내용 | 날짜 | 비고 |
| - | - | - | - |
| 1차 세미나 | 기본 컴포넌트, VC간 이동 | 2020.04.18(토) | |
| 2차 세미나 |  |  | |
| 3차 세미나 |  |  | |
| 4차 세미나 |  |  | |
| 5차 세미나 |  |  | |
| 6차 세미나 |  |  | |
| 7차 세미나 |  |  | |

<br>

<br>

## 1차 과제

__기한: ~2020.04.24(금)__

<div>
<img src="./READMEImg/1차과제.png" width="250" height="450">
</div>

</br>

> present된 VC를 dismiss한 후
AppDelegate의 rootVC에 접근하고
그 rootVC의 NavigationController에 접근해서
VC를 pop해주는 코드
``` swift
    @IBAction func logoutClick(_ sender: Any) {
        // present -> dismiss, push -> pop
        dismiss(animated: true) {
             if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                (appDelegate.window?.rootViewController as? UINavigationController)?.popToRootViewController(animated: true)
            }
        }
    }
```

<br>

> ## AppDelegate

* AppDelegate클래스가 만들어지고, 이 AppDelegate클래스 인스턴스인 delegate가 앱 내용이 그려질 창(window)을 만듬
* 앱의 입력 이벤트를 전달하는 run loop를 생성 

<br>

<br>

## 2차 

__기한:  __