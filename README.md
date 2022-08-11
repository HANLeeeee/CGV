# OpenAPI Practice
> 2022.07.26 ~ 2022.08.01 (1주간) <br/>
> 'CGV' App

<img width="1528" alt="image" src="https://user-images.githubusercontent.com/74815957/184096881-745d9302-2edf-405f-81c9-df107f0abbff.png">


## 📌 Project Goal
- OpenAPI사용하여 데이터받아와서 구현<br/>
- pageViewController 사용하여 슬라이딩 화면 구현 <br/>


<br/><br/>
## 📌 사용한 라이브러리
- Alamofire
 - 네트워크 통신 
- SwiftyJSON
 - JSON Parsing

> pod init 파일 <br/>
```bash
pod 'Alamofire'
pod 'SwiftyJSON', '~> 4.0'
```


<br/><br/>
## 📌 알게된 점
- CocoaPod로 라이브러리설치하기<br/>
- 데이터를 가져온 후 컬렉션뷰에 띄우기 <br/>
  → self.collectionView.reloadData() 이용 <br/>
  → 해당하는 데이터를 불러온 후 컬렉션뷰 리로드 시켜주기 <br/>
- 이미지 URL로 불러올 때 <br/>
  → DispatchQueue.global().async 불러온 후 → DispatchQueue.main.sync 안에서 이미지뷰에 뿌려준다

<br/><br/>
## 📌 아쉬운 점
- 상단탭바 인디게이터 움직임<br/>
- 영화에 맞는 포스터 이미지를 가져오기위해 영화순위는 영화진흥위원회의 API 사용하였고 영화 포스터 이미지는 네이버 검색 API를 이용하였다.


<br/><br/>
## 📌 미리보기



https://user-images.githubusercontent.com/74815957/184098245-929cd98e-486c-4628-a387-3076f1f290a7.mov



https://user-images.githubusercontent.com/74815957/184098257-853fa0f3-559a-443c-b3c2-621cc683b652.mov




<br/><br/>

